;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; If you need your own personal ~/.emacs
;;; please make a copy of this file
;;; an placein your changes and/or extension.
;;;
;;; Copyright (c) 1997-2002 SuSE Gmbh Nuernberg, Germany.
;;;
;;; Author: Werner Fink, <feedback@suse.de> 1997,98,99,2002
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Test of Emacs derivates
;;; -----------------------
(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (progn
      (if (file-readable-p "~/.xemacs/init.el")
	  (load "~/.xemacs/init.el" nil t))
      )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
	(load "/etc/skel/.gnu-emacs" nil t)))

  ;; Custom Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
  (setq custom-file "~/.gnu-emacs-custom")
  (load "~/.gnu-emacs-custom" t t)
;;;
  )
;;;
;;-------------------------basic------------------------------>
(setq column-number-mode t) 
(setq line-number-mode t) 
;;在minibuffer 显示行号及列号
(xterm-mouse-mode 0)
;;默认关闭xterm-mouse-mode
;;(display-time)
;;显示时间
;;(global-linum-mode 'linum-mode)
;;在左列添加行号
;;取消掉，当org文件嵌套太深时上下移动会产生卡顿
;;(setq linum-format "%d ")
;;内容和行号之间加空格
(setq linum-format "%4d\u2502")
;;内容和行号间加实线，默认最大9999行，超过此数时竖线就自动后移
(global-font-lock-mode t) 
;;进行语法加亮。貌似没有起作用!
(setq-default make-backup-files 0) 
;; 不生成临时文件
(electric-pair-mode t) 
;;自动补全括号 
(setq user-mail-address "hitzhzw3889@126.com")
;; 邮箱地址
(setq inhibit-startup-message t)
;; 禁用启动信息
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号
(fset 'yes-or-no-p 'y-or-n-p)
;;以y/n代表yes/no
(setq default-fill-column 80)
;; 默认显示80列就换行
(global-set-key (kbd "RET") 'newline-and-indent)
;;回车自动缩进
(menu-bar-mode 0)
;;去掉菜单栏,nil改为0才有效
;;(tool-bar-mode 0)
;;去掉工具栏，貌似没用
;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;使用了这个扩展之后，你上次离开emacs 时的全局变量 (kill-ring，命令记录……
;;局部变量，寄存器，打开的文件，改过的文件和最后修改的位置，…… 全部都会被记录下来。
;;------------------------auto-complete------------------------>
(add-to-list 'load-path "~/.emacs.d")
;;设置加载路径
;;(require 'auto-complete-config)
;;(ac-config-default)
;;自动补全，暂停使用，换成company-mode
(package-initialize)
(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)
;;company-mode应用到所用窗口
;-----------------------color-theme--------------------------->
(require 'color-theme)
;;主题
;;------------------------------------------------------------->
;;(require 'highlight-indent-guides)
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;(setq highlight-indent-guides-method 'character)    
;;(set-face-background 'highlight-indent-guides-odd-face "red")
;;(set-face-background 'highlight-indent-guides-even-face "#EE00EE")
;;(setq highlight-indent-guides-character ?ξ)
;;(set-face-foreground 'highlight-indent-guides-character-face "#EE00EE")
;;.....................................................................................
;;缩进线，经常出现输入及删除误操作，我估计是因为与自动补全相冲突，竖线很难找到对齐的基准
;;打开新文件是没有问题，编辑时会有问题，可能是由于代码中动态的处理不好
;;.....................................................................................
;;第二行设置线宽，fill为全部填充，column为字符宽度，character为可定制线，默认为细直线
;;第三四行为设置线的颜色
;;第五六行为设置character时，标志和颜色,"\|"可以替换为任何字符，如"ξ"，如果没有则为细直线
;;----------------------------------------------------->
;;(load "desktop")
;;(desktop-load-default)
;;(desktop-read)
;;关闭emacs是键入M-x desktop-save就可把本次离开的buffer记录下来，下次打开emacs时还会保留这些buffer
;;-------------------------senior----------------------------------->
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;启用ibuffer，并绑定快捷键为C-x C-b
;;------------------------------------------------------------------>
(require 'generic-x)
;;更加丰富的高亮
;;------------------------------------------------------------------>
(require 'crosshairs)
;;高亮显示光标所在行和列可以通过M-x crosshairs-mode在当前buffer应用
(require 'hl-line+)
;;高亮光标所在行，可以通过M-x hl-line-mode在当前buffer应用
(require 'vline)
;;高亮光标所在列，可以通过M-x vline-mode在当前buffer应用
;;----------org-mode------------------------------------------->
(setq org-src-fontify-natively t)
;;org-mode下代码也高亮
(defun org-mode-my-init ()
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  (define-key org-mode-map (kbd "。") (kbd "."))
  )
(add-hook 'org-mode-hook 'org-mode-my-init)
;;org-mode下中文输入法时正常输入*及-等
(define-key global-map "\C-ca" 'org-agenda)
;;org-mode之todo中，查看agenda快捷键
(setq org-log-done 'time)
;;当标记为done是自动加时间标签
(setq org-log-done 'note)
;;标记为done是插入便签
;;(setq org-startup-indented t)
;;默认缩进显示
;;----------aggressive-indent-mode------------------------------>
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
;;----------ace-window------------------------------------------>
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;;启用ace-window
;;下面的命令是我只要按M-p，多个窗口就会用单个字母去标记
;;只要输入此字母就会立刻跳到这个窗口
;;----------ido-mode-------------------------------------------->
(require 'ido)
(ido-mode t)
;;----------ido-vertical-mode-------------------------------------------->
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;;Show the count of candidates
(setq ido-vertical-show-count t)
;;默认选项、唯一选项及其他备选项的背景前景色
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
		    :background "#e5b7c0")
(set-face-attribute 'ido-vertical-only-match-face nil
		    :background "#e52b50"
		    :foreground "white")
(set-face-attribute 'ido-vertical-match-face nil
		    :foreground "#b00000")
(ido-vertical-mode 1)
;;----------anthing--------------------------------------------->
(add-to-list 'load-path "~/.emacs.d/anything-config/")
(require 'anything-config)
;;(anything-completion-mode t)
;;功能比ido强大，但是输入时必须好输全，比较坑，可能因为没有设置的缘故                  
;;----------yasnippet------------------------------------------->
(yas-global-mode 1)
;;----------zone-matrix----------------------------------------->
(require 'zone-matrix)
(require 'zone-matrix-settings)
(require 'zone-settings)
(setq zone-programs [zone-matrix])
(zone-when-idle 300)
;;To enable Zone Mode for all buffers
;;after Emacs is idle for 5 minutes
;;----------tabbar-mode----------------------------------------->
(require 'tabbar)
;;(tabbar-mode 1)
(global-set-key (kbd "<C-next>")  'tabbar-forward)
(global-set-key (kbd "<C-prior>")  'tabbar-backward)
;;----------git-emacs------------------------------------------->
(require 'git-emacs)
;;----------htmlize--------------------------------------------->
(require 'htmlize)
;;----------agenda---------------------------------------------->
;;开机自动显示日程表
(org-agenda-list t)
;;关闭其它窗口
(delete-other-windows)
;;----------powerline------------------------------------------->
(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)
;;修饰底部的mode-line
;;----------org-bullets----------------------------------------->
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;美化org-mode中标题
;;----------helm------------------------------------------------>
;;将文件解压到helm中或在helm中git clone，而后在helm中用make命令
;;不能正常使用，以后有时间再搞吧
;;(add-to-list 'load-path "~/.emacs.d/helm/")
;;(require 'helm-config)
;;To bind to M-x
;;(global-set-key (kbd "M-x") 'helm-M-x)
;;To make helm-mode start with Emacs init file
;;(helm-mode 1)
