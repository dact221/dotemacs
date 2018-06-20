(defun set-frame-dark (&optional frame)
  "Set Adwaita dark window decoration for `frame'."
  (unless frame (setq frame (selected-frame)))
  (let ((frame-id (cdr (assq 'outer-window-id (frame-parameters frame)))))
    (call-process-shell-command (concat "xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT 'dark' -id " frame-id))))

(package-initialize)

(custom-set-variables
 '(after-init-hook (quote set-frame-dark) t)
 '(after-make-frame-functions (quote set-frame-dark) t)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (tango-dark)))
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages (quote (color-theme-solarized anaconda-mode)))
 '(python-check-command "mypy")
 '(python-mode-hook (quote (anaconda-mode anaconda-eldoc-mode)) t)
 '(python-shell-interpreter "python3")
 '(show-paren-mode t)
 '(split-height-threshold nil)
 '(split-width-threshold 148)
 '(tool-bar-mode nil)
 '(truncate-lines t))

(custom-set-faces
 '(default ((t (:background "#232729" :foreground "white" :family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 113 :width normal))))
 '(variable-pitch ((t (:family "Source Sans Pro" :foundry "ADBO" :slant normal :weight normal :height 113 :width normal))))
 '(fringe ((t (:background "#232729"))))
 ;; Mode line mimics Adwaita dark gtk theme:
 '(mode-line ((t (:box (:line-width 2 :style released-button) :background "#2c3133" :foreground "#eeeeec"))))
 '(mode-line-inactive ((t (:box (:line-width 2 :color "#202425") :background "#33393b" :foreground "#919494")))))
