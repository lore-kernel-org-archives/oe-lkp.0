Content-Type: multipart/mixed; boundary="===============8815067098084401807=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 03/16] include/linux/huge_mm.h: define is_huge_zero_pmd() if !CONFIG_TRANSPARENT_HUGEPAGE
Date: Tue, 13 Apr 2021 00:56:20 -0600
Message-ID: <20210413065633.2782273-4-yuzhao@google.com>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8815067098084401807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently is_huge_zero_pmd() only exists when
CONFIG_TRANSPARENT_HUGEPAGE=3Dy. This patch adds the function for
!CONFIG_TRANSPARENT_HUGEPAGE.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/huge_mm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index ba973efcd369..0ba7b3f9029c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -443,6 +443,11 @@ static inline bool is_huge_zero_page(struct page *page)
 	return false;
 }
 =

+static inline bool is_huge_zero_pmd(pmd_t pmd)
+{
+	return false;
+}
+
 static inline bool is_huge_zero_pud(pud_t pud)
 {
 	return false;
-- =

2.31.1.295.g9ea45b61b8-goog

--===============8815067098084401807==--

