;; publish.el --- Publish org-mode project on Gitlab Pages
;; Author: Rasmus

;;; Commentary:
;; This script will convert the org-mode files in this directory into
;; html.

;;; Code:

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-install 'org-plus-contrib)
(package-install 'htmlize)

(require 'org)
(require 'ox-publish)

;; setting to nil, avoids "Author: x" at the bottom
(setq user-full-name nil)

(setq org-export-with-section-numbers nil
      org-export-with-smart-quotes t
      org-export-with-toc nil)

(setq org-html-divs '((preamble "header" "top")
                      (content "main" "content")
                      (postamble "footer" "postamble"))
      org-html-container-element "section"
      org-html-metadata-timestamp-format "%Y-%m-%d"
      org-html-checkbox-type 'html
      org-html-html5-fancy nil
      org-html-validation-link nil
      org-html-doctype "html5")

(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")

(setq org-html-use-infojs nil)
(setq org-publish-list-skipped-files nil)

(setq org-publish-project-alist
      (list
       (list "site-org"
             :base-directory "."
             :base-extension "org"
             :recursive t
             :publishing-function '(org-html-publish-to-html)
             :publishing-directory "/var/www/osiux.com"
             :exclude (regexp-opt '("README" "draft"))
             :table-of-contents nil
             :makeindex nil
             :section-numbers nil
             :time-stamp-file nil
             :with-author t
             :with-creator t
             :with-drawers nil
             :with-email nil
             :with-emphasize t
             :with-fixed-width t
             :with-footnotes t
             :with-latex t
             :with-planning nil
             :with-priority nil
             :with-special-strings t
             :with-sub-superscript nil
             :with-tables t
             :with-tags nil
             :with-tasks nil
             :with-timestamps nil
             :with-toc nil
             :with-todo-keywords nil
             :html-inline-images t
             :html-preamble t
             :html-postamble t
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-head-extra "<link rel=\"icon\" type=\"image/x-icon\" href=\"/favicon.ico\"/>"
             :html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"osiux.css\" />"
						 ; SITEMAP
             :auto-sitemap t
             :sitemap-filename "sitemap.org"
             :sitemap-title "ASOLUTELLY NO WARRANTY =sitemap="
						 :sitemap-date-format "%Y-%m-%d"
             :sitemap-file-entry-format "%d - %t"
             :sitemap-style 'list
             :sitemap-sort-files 'anti-chronologically)
						 ; %t is the title
						 ; %a is the author
						 ; %d is the date formated using `org-publish-sitemap-date-format
       (list "site-static"
             :base-directory "."
             :exclude "/var/www/osiux.com/"
             :base-extension site-attachments
             :publishing-directory "/var/www/osiux.com"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "site" :components '("site-org"))))

(provide 'publish)
;;; publish.el ends here
