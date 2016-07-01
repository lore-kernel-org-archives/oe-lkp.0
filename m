Content-Type: multipart/mixed; boundary="===============7992701593460783188=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Fri, 01 Jul 2016 21:14:18 +0800
Message-ID: <20160701131418.GA18214@x1.redhat.com>
In-Reply-To: <20160701121626.GA14984@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7992701593460783188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/01/16 at 08:16pm, Ye Xiaolong wrote:
> On Fri, Jul 01, 2016 at 03:50:32PM +0800, Baoquan He wrote:
> >Hi Xiaolong,
> >
> >Could you please apply below patch and see if it works for you?
> =

> Hi, Baoquan,
> =

> Please check enclosed dmesg after apply your fix patch, does it meet
> your expectation?

It works, but didn't get a random phy addr. I am a little worried. I
guess your system has a very small physical memory space. Could you
apply attached patch on top of fix patch and Yinghai's debug patch and
paste the result? I want to check the physical memory and mem_avoid
region to make sure it.

Or if you can paste /proc/iomem I can have a quick check, then you don't
need to run the patch.

> =

> Thanks,
> Xiaolong
> =

> >
> >From 46c2a9ecd11f61d952253e005bbd7dcbffa652fb Mon Sep 17 00:00:00 2001
> >From: Baoquan He <bhe@redhat.com>
> >Date: Fri, 1 Jul 2016 15:34:40 +0800
> >Subject: [PATCH] x86/KASLR: Fix code bug of finding earliest overlap
> >
> >Signed-off-by: Baoquan He <bhe@redhat.com>
> >---
> > arch/x86/boot/compressed/kaslr.c | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed=
/kaslr.c
> >index 304c5c3..8e1fdf7 100644
> >--- a/arch/x86/boot/compressed/kaslr.c
> >+++ b/arch/x86/boot/compressed/kaslr.c
> >@@ -285,6 +285,7 @@ static bool mem_avoid_overlap(struct mem_vector *img,
> > 		if (mem_overlaps(img, &mem_avoid[i]) &&
> > 		    mem_avoid[i].start < earliest) {
> > 			*overlap =3D mem_avoid[i];
> >+			earliest =3D overlap->start;
> > 			is_overlapping =3D true;
> > 		}
> > 	}
> >@@ -299,6 +300,7 @@ static bool mem_avoid_overlap(struct mem_vector *img,
> > =

> > 		if (mem_overlaps(img, &avoid) && (avoid.start < earliest)) {
> > 			*overlap =3D avoid;
> >+			earliest =3D overlap->start;
> > 			is_overlapping =3D true;
> > 		}
> > =

> >-- =

> >2.5.5
> >



--===============7992701593460783188==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="e820_avoid_printing.patch"

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jIGIvYXJjaC94ODYv
Ym9vdC9jb21wcmVzc2VkL2thc2xyLmMKaW5kZXggOGUxZmRmNy4uZjJiZDU1OCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2thc2xyLmMKKysrIGIvYXJjaC94ODYvYm9vdC9j
b21wcmVzc2VkL2thc2xyLmMKQEAgLTI2MCw2ICsyNjAsMTIgQEAgc3RhdGljIHZvaWQgbWVtX2F2
b2lkX2luaXQodW5zaWduZWQgbG9uZyBpbnB1dCwgdW5zaWduZWQgbG9uZyBpbnB1dF9zaXplLAog
CW1lbV9hdm9pZFtNRU1fQVZPSURfQk9PVFBBUkFNU10uc2l6ZSA9IHNpemVvZigqYm9vdF9wYXJh
bXMpOwogCWFkZF9pZGVudGl0eV9tYXAobWVtX2F2b2lkW01FTV9BVk9JRF9CT09UUEFSQU1TXS5z
dGFydCwKIAkJCSBtZW1fYXZvaWRbTUVNX0FWT0lEX0JPT1RQQVJBTVNdLnNpemUpOworCWZvcihp
bnQgaT0wOyBpPE1FTV9BVk9JRF9NQVg7IGkrKykKKwlkZWJ1Z19wcmludGYoIiAgICAgIG1lbV9h
dm9pZFslZF06IFsweCUwMTBseC0weCUwMTBseF0gMHglMDhseDogc2l6ZVxuIiwKKwkJIGksCisg
ICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKW1lbV9hdm9pZFtpXS5zdGFydCwKKyAgICAg
ICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpIG1lbV9hdm9pZFtpXS5zdGFydCArIG1lbV9hdm9p
ZFtpXS5zaXplIC0gMSwKKyAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpbWVtX2F2b2lk
W2ldLnNpemUpOwogCiAJLyogV2UgZG9uJ3QgbmVlZCB0byBzZXQgYSBtYXBwaW5nIGZvciBzZXR1
cF9kYXRhLiAqLwogCkBAIC0zNzYsNiArMzgyLDExIEBAIHN0YXRpYyB2b2lkIHByb2Nlc3NfZTgy
MF9lbnRyeShzdHJ1Y3QgZTgyMGVudHJ5ICplbnRyeSwKIAlpZiAoZW50cnktPnR5cGUgIT0gRTgy
MF9SQU0pCiAJCXJldHVybjsKIAorCWRlYnVnX3ByaW50ZigiICAgICAgZTgyMCBlbnRyeTogWzB4
JTAxMGx4LTB4JTAxMGx4XSAweCUwOGx4OiBzaXplXG4iLAorICAgICAgICAgICAgICAgICAodW5z
aWduZWQgbG9uZyllbnRyeS0+YWRkciwKKyAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcp
ZW50cnktPmFkZHIgKyBlbnRyeS0+c2l6ZSAtIDEsCisgICAgICAgICAgICAgICAgICh1bnNpZ25l
ZCBsb25nKWVudHJ5LT5zaXplKTsKKwogCS8qIE9uIDMyLWJpdCwgaWdub3JlIGVudHJpZXMgZW50
aXJlbHkgYWJvdmUgb3VyIG1heGltdW0uICovCiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1g4Nl8z
MikgJiYgZW50cnktPmFkZHIgPj0gS0VSTkVMX0lNQUdFX1NJWkUpCiAJCXJldHVybjsK

--===============7992701593460783188==--

