# 说明

Python中的argparse模块能自动地解析命令行参数，并且处理相应的输入异常，比如：

Python中提供了`sys.argv`处理命令行参数。当我们在命令行运行Python脚本时，`sys.argv`是一个list，包含我们在命令行中输入的所有参数和参数值。比如，我们输入：`python caesar_script.py --key 23 --decrypt my secret message`，则打印`sys.argv`可得：

<span style='color:black;background:yellow;font-size:文字大小;font-family:;'>sys.argv 从 位置 0 开始</span> ：sys.argv[0]

~~~python
>>> print(sys.argv)
['caesar_script.py', '--key', '23', '--decrypt', 'my', 'secret', 'message']
~~~

# 例子 

~~~python
Import argparse 

# Funtion defeine
def parse_args(args):  
  parser = argparse.ArgumentParser(description='automatic export from Grindstone to Jira')
  parser.add_argument("--leave", "-l", help="set adjustEstimate in Jira to 'leave'", action='store_const', const=True, default=False)
  parser.add_argument("--dayshift", "-d", help="for which day the script is executed (default today)", type=int, default=0, choices=[-7, -6, -5, -4, -3, -2, -1, 0])
  parser.add_argument("--searchString", "-s", help="string to search for in Grindstone", type=str, default='E22FPL')
  parser.add_argument("--jiraString", "-j", help="string to translate to in Jira", type=str)

  return parser.parse_args(args)


# MAIN FUNCTION                                                                                                      
def main():
    args = parse_args(sys.argv[1:]) # 提取从位置1开始的所有 argumente
    
    # 后期使用的时候， 以 args.xx 的形式 , 比如 args.dayshift， args.jiraString


if __name__ == '__main__':
    main()
~~~

也可以解释 成组显示

~~~python
	parser = argparse.ArgumentParser()
	group = parser.add_mutually_exclusive_group()
	group.add_argument('-e', '--encrypt', action='store_true')
	group.add_argument('-d', '--decrypt', action='store_true')
	parser.add_argument('text', nargs='*')
	parser.add_argument('-k', '--key', type=int, default=1)
	args = parser.parse_args()
  
  这样得到
  >>> python caesar_script_using_argparse.py --help
usage: caesar_script_using_argparse.py [-h] [-e | -d] [-k KEY] [text [text ...]]

positional arguments:
	text

optional arguments:
	-h, --help show this help message and exit
	-e, --encrypt
	-d, --decrypt
	-k KEY, --key KEY
~~~

