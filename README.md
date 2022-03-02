<div id="top"></div>

<div style="text-align:center"><img src="images/cover_page.png" /></div>

<!-- ABOUT THE PROJECT -->
## Optimising Transatlantic Flight Paths

This project is my dissertation which got me a first-class. Markdown will only be explaining how to set-up the files and will talk about programs used.
If you would like to learn more about the project, then please head over to my [blog post](https://erolgelbul.com/project-blog/graphing-calculator) for an in-depth explanation
on the project. My paper is also available on the post.


<p align="right">(<a href="#top">back to top</a>)</p>

### Technologies


* [Logisim](http://www.cburch.com/logisim/)
* cdm-8

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Before downloading the project files, you need to make sure you have the following installed. For CocoIDE you need python3. Addtionally, you need Java 5 or above for Logisim.


**How to install Python 3**

Links:
- [Python](https://python.org/) homepage
- [Python docs](https://docs.python.org/)


How to install:

- Debian/Ubuntu
    1. Install using [apt-get](https://linux.die.net/man/8/apt-get).
        ```sh
        $ sudo apt-get update
        $ sudo apt-get install python3
        ```
- macOS
    1. Install [Brew](https://brew.sh).
    2. Install Python using Brew.
        ```sh
        $ brew install python3
        ```
- Windows
    1. Download Python from the [Windows Download](https://www.python.org/downloads/windows/) page.
    2. Run the installer.
        - Be sure to _check_ the box to have Python added to your PATH if the installer offers such an option (it's normally off by default).

For more details, see this gist - [Set up a Python 3 virtual environment](https://gist.github.com/MichaelCurrin/3a4d14ba1763b4d6a1884f56a01412b7).



**How to install Default JRE/JDK**

- Debian/Ubuntu
The easiest option for installing Java is using the version packaged with Ubuntu. Specifically, this will install OpenJDK 8, the latest and recommended version.

First, update the package index.

Next, install Java. Specifically, this command will install the Java Runtime Environment (JRE).

        * sudo apt-get install default-jre
        
- Windows
  1. Download Java from the [Windows Download](https://java.com/en/download/help/download_options.html) page.
  2. Run the installer.

- macOS
People on the Stackoverflow cautioned not to install 8 until 7 is installed. So we are going to install JDK 7 first.

Unlike other version managers such as NVM, jEnv itself doesn’t install JDKs. You have to do it yourself. Luckily, Homebrew Cask made this task really easy.
But before doing that, let’s check if we already have JDK 7 installed by Homebrew Cask:

```sh
brew tap caskroom/versions
brew cask info java7
```




<!-- SET-UP -->
## Setting up Logisim

Download [Logisim](http://www.cburch.com/logisim/).
Follow the instructions on the page. Run the installer.

1. Install/fork project files.
2. Run the Logisim program.
3. Go to `File`.
4. Click on `Open`.
5. Select the project file name: `Graph Calculator Code.asm`
6. Software will ask for a library named cdm-8, it is also provided with the project files. Add the library to the program on the dialog box that pops up.
7. If the dialog box does not open, go to `Project`, then click on `Load Library` and upload the cdm-8 library manually.
8. Manually change the coefficient values by pushing the buttons above the graph.
9. From `Simulate`, increase the `Tick Frequency` to 4.1 KHz.
10. `CTRL+K` to enable ticks.


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- SET-UP -->
## Setting up CocoIDE

If you were able to get your hands on CocoIDE:

1. Install/fork project files.
2. Run CocoIDE using python3.
3. Go to `Open`.
4. Select the project file name: `Graph Calculator Mark 4.circ`
5. Press `Compile Reset`
6. Drag the slider towards `Step` to analyse each execution, memory and the registers.

<p align="right">(<a href="#top">back to top</a>)</p>




<!-- CONTRIBUTING -->
## Contributing

If you would like to add any extra features to the Logisim simulation, feel free to fork and create a pull request. Thank you!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>




<!-- CONTACT -->
## Contact

Erol Gelbul - [Website](erolgelbul.com) - erolgelbul@gmail.com

Project Link: [Graphing Calculator](https://github.com/ErolGelbul/low_level_graph_calculator)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Many thanks to Alex Shafarenko and Stephen Hunt. They are remarkable for creating a brilliant low level IDE for real-time program code analysis. Everything I know about
assembly, they taught me.

<p align="right">(<a href="#top">back to top</a>)</p>


