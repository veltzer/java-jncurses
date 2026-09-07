# java-jncurses

A Java JNI/SWIG interface to GNU ncurses on Linux.

It exposes the whole of ncurses as a single class with static methods,
for writing console applications or installers in Java where
`System.out` is not enough.

The interface is deliberately low level: it gives you ncurses itself
rather than a higher-level API that works the same everywhere. Linux
and ncurses are the only targets — BSD and other systems work where
they provide ncurses. The full rationale and design decisions are in
`README`.

Licensed under the LGPL, so other licenses can run on top of it.
