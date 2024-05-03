[![pub package](https://img.shields.io/pub/v/linkpeek_module.svg)](https://pub.dartlang.org/packages/linkpeek_module)

[![juneflow_github](https://img.shields.io/badge/Juneflow-GitHub-181717?style=for-the-badge&logo=github)](https://github.com/melodysdreamj/juneflow)
[![](https://img.shields.io/badge/View-Hub-007bff?style=for-the-badge&logo=flutter)](https://view.juneflow.org/)

# linkpeek_module
get metadata from link and example

##  Installation
1. If the juneflow project doesn't exist, please create it by following [this guide](https://doc.juneflow.org/).
2. open terminal in the juneflow project root directory, enter the following command.
 ```bash
 june add linkpeek_module
 ```

## Usage
```dart
LinkPeekModel? linkPeekModel = await LinkPeek.fromUrl('https://youtube.com/shorts/-uNcserCtXE?si=Zgn-beswL-l-A9kx');
print('title: ${linkPeekModel.title}');
print('url: ${linkPeekModel.url}');
print('description: ${linkPeekModel.description}');
print('defaultColor: ${linkPeekModel.defaultColor}');
print('colorScheme: ${linkPeekModel.colorScheme}');
print('domain: ${linkPeekModel.domain}');
print('thumbnail: ${linkPeekModel.thumbnail}');
print('favicon: ${linkPeekModel.webIcon}');
```
