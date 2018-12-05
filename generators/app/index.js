var Generator = require('yeoman-generator');
var glob = require("glob")
var uuidv1 = require('uuid/v1');

module.exports = class extends Generator {

    prompting() {
        var self = this;

        return this.prompt([{
                type: 'input',
                name: 'moduleName',
                message: 'Module Name',
                default: 'MyPSModule01' // Default to current folder name
            },
            {
                type: 'input',
                name: 'moduleInfix',
                message: 'Module Infix',
                default: 'MyMOD' // Default to current folder name
            }
        ]).then((answers) => {
            this.log('app name', answers.moduleName);
            self.props = answers;

            var guid = uuidv1();
            self.props.guid = guid;
        });
    }

    writing() {
        this.log('Writing ');
        var self = this;
        var dir = __dirname + '\\templates';
        var globPattern = "**/*"
        this.log(dir);
        glob(globPattern, {
                cwd: dir,
                nodir: true,
                nonull: true,
                dot: true
            },
            function (err, files) {
                files.forEach(function (file) {
                    console.log(file);
                    var destinationFile = file.replace(/__PSMODULEINFIX__/g, self.props.moduleInfix)
                    destinationFile = destinationFile.replace(/__PSMODULE__/g, self.props.moduleName);
                  
                    self._copyTpl(file, destinationFile);
                });
            });
    }

    _copyTpl(file, destination) {
        var self = this;
        this.log('Writing ' + file + ' ' + destination);

        // destination = destination || file;
        this.fs.copyTpl(
            this.templatePath(file),
            this.destinationPath(destination), {
                moduleName: self.props.moduleName,
                moduleInfix: self.props.moduleInfix,
                guid: self.props.guid
            }
        );
    }
};