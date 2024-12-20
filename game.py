import turtle
import time
import random

delay = 0.2  # 调整延迟时间来改变蛇的速度

# 创建窗口
window = turtle.Screen()
window.title("贪吃蛇游戏")
window.bgcolor("black")
window.setup(width=600, height=600)
window.tracer(0)

# 创建蛇头
head = turtle.Turtle()
head.speed(0)
head.shape("square")
head.color("white")
head.penup()
head.goto(0, 0)
head.direction = "Stop"

# 蛇身列表
segments = []

# 创建食物
food = turtle.Turtle()
food.speed(0)
food.shape("circle")
food.color("red")
food.penup()
food.goto(0, 100)

# 移动函数
def move():
    if head.direction == "Up":
        y = head.ycor()
        head.sety(y + 20)
    if head.direction == "Down":
        y = head.ycor()
        head.sety(y - 20)
    if head.direction == "Left":
        x = head.xcor()
        head.setx(x - 20)
    if head.direction == "Right":
        x = head.xcor()
        head.setx(x + 20)

    # 设置定时器事件
    window.ontimer(move, 100)
    
# 键盘事件处理函数
def go_up():
    if head.direction != "Down":
        head.direction = "Up"

def go_down():
    if head.direction != "Up":
        head.direction = "Down"

def go_left():
    if head.direction != "Right":
        head.direction = "Left"

def go_right():
    if head.direction != "Left":
        head.direction = "Right"

# 检测碰撞函数
def is_collision(t1, t2):
    if t1.distance(t2) < 20:
        return True
    else:
        return False
    
# 自动移动函数
def auto_move():
    if head.xcor() < food.xcor():
        head.direction = "Right"
    elif head.xcor() > food.xcor():
        head.direction = "Left"
    elif head.ycor() < food.ycor():
        head.direction = "Up"
    elif head.ycor() > food.ycor():
        head.direction = "Down"

# # 键盘绑定
# window.listen()
# window.onkey(go_up, "w")
# window.onkey(go_down, "s")
# window.onkey(go_left, "a")
# window.onkey(go_right, "d")

# 主循环
while True:
    window.update()

    auto_move()

    move()

    # 检测碰撞边界...

    # 检测碰撞食物
    if is_collision(head, food):
        # 食物移动到随机位置
        x = random.randint(-290, 290)
        y = random.randint(-290, 290)
        food.goto(x, y)

        # 增加蛇身
        new_segment = turtle.Turtle()
        new_segment.speed(0)
        new_segment.shape("square")
        new_segment.color("grey")
        new_segment.penup()
        segments.append(new_segment)

    # 移动蛇身
    for i in range(len(segments) - 1, 0, -1):
        x = segments[i-1].xcor()
        y = segments[i-1].ycor()
        segments[i].goto(x, y)

    # 移动蛇头到指定位置
    if len(segments) > 0:
        x = head.xcor()
        y = head.ycor()
        segments[0].goto(x, y)

    time.sleep(delay)  # 延迟一段时间