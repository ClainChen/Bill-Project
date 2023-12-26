## 一些工具类:[br]
##
## 正则表达式相关工具: [Tools.RegexTool][br]

class_name Tools

## 正则表达式相关工具
class RegexTool:
	## 检测字符串是否匹配指定正则表达式
	static func match(string: String, regex: RegEx) -> bool:
		return regex.search(string).get_string() == string
	
