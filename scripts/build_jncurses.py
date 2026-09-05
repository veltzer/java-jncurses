#!/usr/bin/env python

""" Build libjncurses.so and jncurses.jar from jncurses.i, replacing the
autotools build (configure.ac + Makefile.am).

Steps, exactly as the Makefile did them:
  1. swig -java generates jncurses_wrap.c and the Java binding sources
  2. gcc compiles the wrapper against the JNI headers into a shared object
     linked with the wide-character ncurses family
  3. javac + jar package the generated Java sources
  4. the test program under src/ is compiled against the jar into test.jar

Everything generated lands under out/. """

import glob
import os
import shutil
import subprocess
import sys

PACKAGE = "jncurses"
OUT = "out"
AUTOSRC = os.path.join(OUT, "autosrc")
AUTOCLASSES = os.path.join(OUT, "autobin")
TESTCLASSES = os.path.join(OUT, "bin")
LIBS = ["-lncursesw", "-lformw", "-lmenuw", "-lpanelw"]


def run(args):
    """ run a command, aborting the build on failure """
    ret = subprocess.call(args)
    if ret != 0:
        sys.exit(ret)


def jni_include_dirs():
    """ locate the JNI headers next to the javac that is on the PATH """
    javac = shutil.which("javac")
    if javac is None:
        sys.exit("javac not found on PATH")
    home = os.path.dirname(os.path.dirname(os.path.realpath(javac)))
    include = os.path.join(home, "include")
    return [include, os.path.join(include, "linux")]


def main():
    """ main entry point """
    swig_out = os.path.join(AUTOSRC, PACKAGE)
    os.makedirs(swig_out, exist_ok=True)
    wrap_c = os.path.join(OUT, f"{PACKAGE}_wrap.c")
    run(["swig", "-Wall", "-Werror", "-java", "-outdir", swig_out,
         "-package", PACKAGE, "-o", wrap_c, f"{PACKAGE}.i"])
    lib = os.path.join(OUT, f"lib{PACKAGE}.so")
    run(["gcc", "-Wall", "-Werror", "-Wno-unused-but-set-variable",
         "-Wno-unused-function", "-O2", "-fno-strict-aliasing", "-fPIC",
         "-shared"] + [f"-I{d}" for d in jni_include_dirs()]
        + ["-o", lib, wrap_c] + LIBS)
    os.makedirs(AUTOCLASSES, exist_ok=True)
    run(["javac", "-Xlint:deprecation", "-Xlint:unchecked", "-d", AUTOCLASSES,
         "-sourcepath", AUTOSRC]
        + sorted(glob.glob(os.path.join(AUTOSRC, "**", "*.java"), recursive=True)))
    jar = os.path.join(OUT, f"{PACKAGE}.jar")
    run(["jar", "-cf", jar, "-C", AUTOCLASSES, "."])
    os.makedirs(TESTCLASSES, exist_ok=True)
    run(["javac", "-classpath", jar, "-Xlint:deprecation", "-Xlint:unchecked",
         "-d", TESTCLASSES, "-sourcepath", "src"]
        + sorted(glob.glob(os.path.join("src", "**", "*.java"), recursive=True)))
    run(["jar", "-cf", os.path.join(OUT, "test.jar"), "-C", TESTCLASSES, "."])


if __name__ == "__main__":
    main()
