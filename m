Content-Type: multipart/mixed; boundary="===============3403241567024050520=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Fri, 01 Jul 2016 15:50:32 +0800
Message-ID: <20160701075032.GC10467@x1.redhat.com>
In-Reply-To: <57712812.r6MdDSquaCRYkMnh%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3403241567024050520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

Could you please apply below patch and see if it works for you?

>From 46c2a9ecd11f61d952253e005bbd7dcbffa652fb Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Fri, 1 Jul 2016 15:34:40 +0800
Subject: [PATCH] x86/KASLR: Fix code bug of finding earliest overlap

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/boot/compressed/kaslr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/ka=
slr.c
index 304c5c3..8e1fdf7 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -285,6 +285,7 @@ static bool mem_avoid_overlap(struct mem_vector *img,
 		if (mem_overlaps(img, &mem_avoid[i]) &&
 		    mem_avoid[i].start < earliest) {
 			*overlap =3D mem_avoid[i];
+			earliest =3D overlap->start;
 			is_overlapping =3D true;
 		}
 	}
@@ -299,6 +300,7 @@ static bool mem_avoid_overlap(struct mem_vector *img,
 =

 		if (mem_overlaps(img, &avoid) && (avoid.start < earliest)) {
 			*overlap =3D avoid;
+			earliest =3D overlap->start;
 			is_overlapping =3D true;
 		}
 =

-- =

2.5.5


--===============3403241567024050520==--

