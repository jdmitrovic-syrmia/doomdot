;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jovan Dmitrovic"
      user-mail-address "jdmitrovic@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;;(setq doom-font (font-spec :family "DroidSansMono Nerd Font Mono" :size 12 :weight 'medium))
(setq! doom-unicode-font (font-spec :family "Droid Sans Mono For Powerline" :size 11))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(after! tex-mode
  (map-delete sp-pairs 'LaTeX-mode)
  (map-delete sp-pairs 'latex-mode)
  (map-delete sp-pairs 'tex-mode)
  (map-delete sp-pairs 'plain-tex-mode))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; new line without switching to insert mode
(defun evil-open-below-noinsert (count)
  (interactive "p")
  (unless (eq evil-want-fine-undo t)
    (evil-start-undo-step))
  (push (point) buffer-undo-list)
  (evil-insert-newline-below)
  (setq evil-insert-count count
        evil-insert-lines t
        evil-insert-vcount nil))

(map! :n "o" nil)
(map! :n "o" #'evil-open-below-noinsert)

(defun evil-open-above-noinsert (count)
  (interactive "p")
  (unless (eq evil-want-fine-undo t)
    (evil-start-undo-step))
  (evil-insert-newline-above)
  (setq evil-insert-count count
        evil-insert-lines t
        evil-insert-vcount nil))

(map! :n "O" nil)
(map! :n "O" #'evil-open-above-noinsert)

(after! lsp-ui (setq lsp-ui-doc-show-with-cursor t))

(setq lsp-clients-clangd-args '("-j=3"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;;(after! ccls
;;  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
;;  (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom

;;(setq lsp-prefer-flymake nil)

;; LLVM IR Syntax Highlighting
(setq load-path
      (cons (expand-file-name "~/.llvm_emacs") load-path))
(require 'llvm-mode)

(setq load-path
      (cons (expand-file-name "~/.llvm_emacs") load-path))
(require 'tablegen-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq-default tab-width 4)

(map! :leader
      :desc "Select previous search"
      "s r" #'vertico-repeat-select)

(map! :leader
      :desc "LSP Format buffer"
      "c f" #'lsp-format-buffer)

;; Enable cpptools
(after! dap-mode
  (require 'dap-cpptools))

;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))

;; Default enable pdf-tools Dark mode
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)

(setq highlight-indent-guides-method 'column)

(setq markdown-command "markdown")

;;Disable corfu's autocomplete with TAB
;; (map! :n "TAB" nil)
;; (after! corfu (setq tab-always-indent t))
