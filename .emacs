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
(setq column-number-mode t) 
(setq line-number-mode t) 
;;在minibuffer 显示行号及列号
(global-linum-mode 'linum-mode) 
;;在左列添加行号
(setq global-font-lock-mode t) 
;;进行语法加亮。貌似没有起作用!
(setq-default make-backup-files nil) 
;; 不生成临时文件
(electric-pair-mode t) 
;;自动补全括号 
(setq user-mail-address "hitzhzw3889@126.com")
;; 邮箱地址
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(ac-config-default)
;;自动补全
(require 'color-theme)
;;主题
(require 'highlight-indent-guides)
;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;(setq highlight-indent-guides-method 'character)    
;(set-face-background 'highlight-indent-guides-odd-face "red")
;(set-face-background 'highlight-indent-guides-even-face "#EE00EE")
;;(setq highlight-indent-guides-character ?ξ)
;(set-face-foreground 'highlight-indent-guides-character-face "#EE00EE")
;;缩进线，经常出现误操作，我估计是因为与自动补全相冲突，竖线很难找到对齐的基准
;;第二行设置线宽，fill为全部填充，column为字符宽度，character为可定制线，默认为细直线
;;第三四行为设置线的颜色
;;第五六行为设置character时，标志和颜色,"\|"可以替换为任何字符，如"ξ"，如果没有则为细直线
(defun org-mode-my-init ()
  ; ......
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  )
(add-hook 'org-mode-hook 'org-mode-my-init)
;;org-mode下中文输入法时正常输入*及-
(setq org-src-fontify-natively t)
;;org-mode下代码也高亮
