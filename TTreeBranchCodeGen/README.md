### 基本流水线

0. 起始点：各个`templates/<template>.cpp`记载模板代码，`template_list.txt`为模板名称总清单。模板代码使用占位符`__TTREE_NAME`和`__BRANCH_NAME`，分别为`TTree`对象的名称和分支名称。
1. 初步展开（按物理量）：在`__BRANCH_NAME`这个位置进行展开，扩展为`__PO_NAME-<branch>`的格式。其中`<branch>`部分将被顺次替换为`quantities.txt`所载明的各个物理量（将在`TTree`中建构为分支），并且“堆叠好”，储存为各个`branched_templates/<template>.cpp`。
2. 完全展开（按物理对象）：对于每一个模板`<template>`，建立相应文件夹`expanded-<template>`，并识别其中占位符`__PO_NAME`，替换成相对应的`<physics_object>`（列于`POs.txt`），并按照物理对象分别存储成`expanded-<template>/<physics_object>.cpp`。
3. 分模板合并代码：对于每一个模板`<template>`与相应文件夹`expanded-<template>`，将其中代码连缀为`full-<template>.cpp`


### 中间脚本
#### `subst_expand.sh`：展开式替换
```bash
./subst_expand.sh -i <file> -w <keyword> <word_list>
```
##### 参数
`<file>` ：将被处理的文件。

`<keyword>`：将被替换的关键词。

`<word_list>`：将替换入的关键词，每行一个。会执行“批量展开”。