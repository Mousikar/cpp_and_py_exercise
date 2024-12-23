import tkinter as tk
import random
import time
import tkinter.messagebox

class NumberClickGame:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("数字点击游戏")
        self.root.geometry("300x300")

        self.numbers = list(range(1, 26))
        random.shuffle(self.numbers)
        self.start_time = None
        self.clicked_numbers = []

        self.create_grid()

        self.root.mainloop()

    def create_grid(self):
        for row in range(5):
            for col in range(5):
                index = row * 5 + col
                num = self.numbers[index]
                btn = tk.Button(self.root, text=str(num), width=5, height=2,
                                command=lambda n=num: self.click_number(n))
                btn.grid(row=row, column=col)

    def click_number(self, num):
        if not self.start_time:
            if num == 1:
                self.start_time = time.time()
            else:
                tk.messagebox.showinfo("提示", "请先点击数字1开始游戏")
                return
        else:
            self.clicked_numbers.append(num)
            if self.clicked_numbers == sorted(self.clicked_numbers):
                if num == 25:
                    end_time = time.time()
                    elapsed_time = end_time - self.start_time
                    tkinter.messagebox.showinfo("游戏结束", f"你完成游戏用时{elapsed_time:.2f}秒")
                    self.root.destroy()
            else:
                tk.messagebox.showinfo("提示", "请按数字从小到大的顺序点击哦")


if __name__ == "__main__":
    game = NumberClickGame()
    