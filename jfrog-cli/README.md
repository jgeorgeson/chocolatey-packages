# jfrog-cli
This repository contains all of the files necessary to generate a Chocolatey package for the JFrog-CLI application. There are two supported options for distribution.

## Distribution
### Chocolatey
The package is available for download from [Chocolatey.org](https://chocolatey.org/packages/jfrog-cli/). A major benefit of downloading from their site is that you can be sure that you are using the most recent stable / tested version available.

### Package and host locally
You can also download this repository. Then in a Command Line or PowerShell session navigate to `C:\PathToDirectory\jfrog-cli\`, once there run ```choco pack```. This will create a Chocolatey Package with the currently downloaded source.

From here you can add the `jfrog-cli` directory or its parent to your Chocolatey Sources. If you are storing multiple package locally I would add the parent directory to as a source. You can check out the Chocolatey [documentation](https://github.com/chocolatey/choco/wiki/CommandsSources) for more information. 

## Legal
I do not own the rights to the JFrog-CLI application so please reference the package's NuSpec file for the license for the JFrog-CLI application. The Chocolatey package however is owned and maintained by myself and will be licensed according to the MIT [license](.\License.md) file within this repository.  