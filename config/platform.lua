-- platform definition

PYTHON_REQUIRES = ">=3.12"

LICENSE_TYPE = "MIT"

PLATFORMS = {
    "python3",
}

-- These used to be symbolic constants from the "pyclassifiers.values" python
-- package (DevelopmentStatus__4_Beta, ...). Lua cannot import that package, so
-- the strings are spelled out. They are the exact values those constants held.
CLASSIFIERS = {
    "Development Status :: 4 - Beta",
    "Environment :: Console",
    "Operating System :: OS Independent",
    "Programming Language :: Python",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3 :: Only",
    "Programming Language :: Python :: 3.12",
    "Topic :: Utilities",
    "License :: OSI Approved :: MIT License",
}
