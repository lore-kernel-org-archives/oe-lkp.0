Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB318BF1
	for <oe-lkp@lists.linux.dev>; Wed,  7 Dec 2022 20:18:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id fu10so8644875qtb.0
        for <oe-lkp@lists.linux.dev>; Wed, 07 Dec 2022 12:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R6C5DcFpFc2RC/VN4Pp8i/xOJBHO01e8lvht5r7K61c=;
        b=FVHzc1Nzcubhpitnmdjp31Lnub/ZhDvqu9e/uatKzf2uR4QTQImhxX19EuI9u12moV
         SnND9+i/xO3Qs9svwwOYGev/SiK9WlLtlv/fDmvMgO/bb4HlkDg395wk4qtdCI8kt3No
         9SaHu15MEcqNpryN1CLzU0EmFES2C5ah8pCWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6C5DcFpFc2RC/VN4Pp8i/xOJBHO01e8lvht5r7K61c=;
        b=XXFxdrzJ3JE2pGFUNktM6DlhuEj7aOQ6cNBQ3aWdgdmjG1quxonxcjE+xVLASG4X66
         gvetetT2SyVaDqAffXtfy0cC7sipX3SsEKXETNpEMWQboCFuyd8L+gM7FbL9jYzXizhA
         k57VvahzjDa3JxnxuiDd4aGAKFhAGYiT/I7gtNJmO8gE9qBQ3ZmmvHYtjYzo1Hvae53Q
         h8U+iorwOzGIIG+bAFkhmY3JwcSdXhw1TCTralt50aj3BhhCfvVk5mpluyD2/ni5rF6K
         dRK5EXhj/2u1OK1JmW7WUfLmeVVBc6EQ9sjc+3xkicC0vvFc3ITmTLD8py7ase5cYzPz
         xgow==
X-Gm-Message-State: ANoB5pkEuoQQNoMqJjLSO+m0xrwXyMIHNWT46tSCnUAuAXFmE5nVRQb5
	IonPtRdmbZEuYGR+W+q8vWcChMusEdV0n+2X
X-Google-Smtp-Source: AA0mqf6YmT86UYeva2qHDHZYgBG0A1Br95iQ/t7R245/lAACTVCDOlrz4keY+6aELNg4xYvnsrEj2Q==
X-Received: by 2002:a05:622a:22a9:b0:394:a30:b606 with SMTP id ay41-20020a05622a22a900b003940a30b606mr84746850qtb.159.1670444287802;
        Wed, 07 Dec 2022 12:18:07 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id s11-20020a05620a0bcb00b006fcab4da037sm14862620qki.39.2022.12.07.12.18.04
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 12:18:05 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id a16so1948682qtw.10
        for <oe-lkp@lists.linux.dev>; Wed, 07 Dec 2022 12:18:04 -0800 (PST)
X-Received: by 2002:ac8:4992:0:b0:3a7:648d:23d4 with SMTP id
 f18-20020ac84992000000b003a7648d23d4mr15651002qtq.180.1670444283686; Wed, 07
 Dec 2022 12:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051534.852804af-yujie.liu@intel.com> <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com>
 <87ilipffws.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
 <CAHk-=whjis-wTZKH20xoBW3=1qyygYoxJORxXx8ZpJbc6KtROw@mail.gmail.com> <878rjj22mz.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <878rjj22mz.fsf@yhuang6-desk2.ccr.corp.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Dec 2022 12:17:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=whkL5aM1fR7kYUmhHQHBcMUc-bDoFP7EwYjTxy64DGtvw@mail.gmail.com>
Message-ID: <CAHk-=whkL5aM1fR7kYUmhHQHBcMUc-bDoFP7EwYjTxy64DGtvw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 5df397dec7: will-it-scale.per_thread_ops
 -53.3% regression
To: "Huang, Ying" <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arch@vger.kernel.org, feng.tang@intel.com, 
	zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: multipart/mixed; boundary="00000000000025d1ff05ef429ef6"

--00000000000025d1ff05ef429ef6
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 9:41 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> I have tested the patch, it does fix the regression

Thanks.

Andrew, here's the patch with a proper commit message. Note that my
commit message contains the SHA1 of the original patch both in the
explanation and in a "Fixes:" line, which I think is fine for the
"mm-stable" branch that the original patch is in.

But if you end up rebasing that mm-stable branch, then I'd ask you to
either remove/update those commit hashes, or just fold this fix into
the original one. Ok?

             Linus

--00000000000025d1ff05ef429ef6
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-mmu_gather-allow-more-than-one-batch-of-delayed-r.patch"
Content-Disposition: attachment; 
	filename="0001-mm-mmu_gather-allow-more-than-one-batch-of-delayed-r.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lbe3dmb70>
X-Attachment-Id: f_lbe3dmb70

RnJvbSBkNjYwNWUyN2M5ZDlmZDU3ZjY3NzJkZTEyZjU0MDY1NTlmY2VkNmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFR1ZSwgNiBEZWMgMjAyMiAxMToxNTowOSAtMDgwMApTdWJqZWN0OiBb
UEFUQ0hdIG1tOiBtbXVfZ2F0aGVyOiBhbGxvdyBtb3JlIHRoYW4gb25lIGJhdGNoIG9mIGRlbGF5
ZWQgcm1hcHMKCkNvbW1pdCA1ZGYzOTdkZWM3YzQgKCJtbTogZGVsYXkgcGFnZV9yZW1vdmVfcm1h
cCgpIHVudGlsIGFmdGVyIHRoZSBUTEIKaGFzIGJlZW4gZmx1c2hlZCIpIGxpbWl0ZWQgdGhlIHBh
Z2UgYmF0Y2hpbmcgZm9yIHRoZSBtbXUgZ2F0aGVyCm9wZXJhdGlvbiB3aGVuIGEgZGlydHkgc2hh
cmVkIHBhZ2UgbmVlZGVkIHRvIGRlbGF5IHJtYXAgcmVtb3ZhbCB1bnRpbAphZnRlciB0aGUgVExC
IGhhZCBiZWVuIGZsdXNoZWQuCgpJdCBkaWQgc28gYmVjYXVzZSBpdCBuZWVkcyB0byB3YWxrIHRo
YXQgYXJyYXkgb2YgcGFnZXMgd2hpbGUgc3RpbGwKaG9sZGluZyB0aGUgcGFnZSB0YWJsZSBsb2Nr
LCBhbmQgb3VyIG1tdV9nYXRoZXIgaW5mcmFzdHJ1Y3R1cmUgYWxsb3dzCmZvciBiYXRjaGluZyBx
dWl0ZSBhIGxvdCBvZiBwYWdlcy4gIFdlIG1heSBoYXZlIHRob3VzYW5kcyBvbiBwYWdlcwpxdWV1
ZWQgdXAgZm9yIGZyZWVpbmcsIGFuZCB3ZSB3YW50ZWQgdG8gd2FsayBvbmx5IHRoZSBsYXN0IGJh
dGNoIGlmIHdlCnRoZW4gYWRkZWQgYSBkaXJ0eSBwYWdlIHRvIHRoZSBxdWV1ZS4KCkhvd2V2ZXIs
IHdoZW4gSSBsaW1pdGVkIGl0IHRvIG9uZSBiYXRjaCwgSSBkaWRuJ3QgdGhpbmsgb2YgdGhlCmRl
Z2VuZXJhdGUgY2FzZSBvZiB0aGUgc3BlY2lhbCBmaXJzdCBiYXRjaCB0aGF0IGlzIGVtYmVkZGVk
IG9uLXN0YWNrIGluCnRoZSBtbXVfZ2F0aGVyIHN0cnVjdHVyZSAoY2FsbGVkICJsb2NhbCIpIGFu
ZCB0aGF0IG9ubHkgaGFzIGVpZ2h0CmVudHJpZXMuCgpTbyB3aXRoIHRoZSByaWdodCBwYXR0ZXJu
LCB0aGF0ICJsaW1pdCBkZWxheWVkIHJtYXAgdG8ganVzdCBvbmUgYmF0Y2giCndpbGwgdHJpZ2dl
ciBvdmVyIGFuZCBvdmVyIGluIHRoYXQgZmlyc3Qgc21hbGwgYmF0Y2gsIGFuZCB3ZSdsbCB3YXN0
ZSBhCmxvdCBvZiB0aW1lIGZsdXNoaW5nIFRMQidzIGV2ZXJ5IGVpZ2h0IHBhZ2VzLgoKQW5kIHRo
b3NlIHJpZ2h0IHBhdHRlcm5zIGFyZSB0cml2aWFsbHkgdHJpZ2dlcmVkIGJ5IGp1c3QgaGF2aW5n
IGEgc2hhcmVkCm1hcHBpbmdzIHdpdGggbG90cyBvZiBhZGphY2VudCBkaXJ0eSBwYWdlcy4gIExp
a2UgdGhlICdwYWdlX2ZhdWx0MycKc3VidGVzdCBvZiB0aGUgJ3dpbGwtaXQtc2NhbGUnIGJlbmNo
bWFyaywgdGhhdCBqdXN0IG1hcHMgYSBzaGFyZWQgYXJlYSwKZGlydGllcyBhbGwgcGFnZXMsIGFu
ZCB1bm1hcHMgaXQuICBSaW5zZSBhbmQgcmVwZWF0LgoKV2Ugc3RpbGwgd2FudCB0byBsaW1pdCB0
aGUgYmF0Y2hpbmcsIGJ1dCB0byBmaXggdGhpcyAoZWFzaWx5IHRyaWdnZXJlZCkKZGVnZW5lcmF0
ZSBjYXNlLCBqdXN0IGV4cGFuZCB0aGUgIm9ubHkgb25lIGJhdGNoIiBsb2dpYyB0byBpbnN0ZWFk
IGJlCiJvbmx5IG9uZSBiYXRjaCB0aGF0IGlzbid0IHRoZSBzcGVjaWFsIGZpcnN0IG9uLXN0YWNr
ICgnbG9jYWwnKSBiYXRjaCIuCgpUaGF0IHdheSwgd2hlbiB3ZSBuZWVkIHRvIGZsdXNoIHRoZSBk
ZWxheWVkIHJtYXBzLCB3ZSBjYW4gc3RpbGwgbGltaXQKb3VyIHdhbGsgdG8ganVzdCB0aGUgbGFz
dCBiYXRjaCAtIGFuZCB0aGF0IGZpcnN0IHNtYWxsIG9uZS4KCkZpeGVzOiA1ZGYzOTdkZWM3YzQg
KCJtbTogZGVsYXkgcGFnZV9yZW1vdmVfcm1hcCgpIHVudGlsIGFmdGVyIHRoZSBUTEIgaGFzIGJl
ZW4gZmx1c2hlZCIpClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8eXVqaWUubGl1QGlu
dGVsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2UtbGtwLzIwMjIxMjA1MTUz
NC44NTI4MDRhZi15dWppZS5saXVAaW50ZWwuY29tClRlc3RlZC1ieTogSHVhbmcsIFlpbmcgPHlp
bmcuaHVhbmdAaW50ZWwuY29tPgpUZXN0ZWQtYnk6IEh1Z2ggRGlja2lucyA8aHVnaGRAZ29vZ2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgotLS0KIG1tL21tdV9nYXRoZXIuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21tdV9nYXRoZXIuYyBiL21tL21tdV9nYXRoZXIu
YwppbmRleCA4MjQ3NTUzYTY5YzIuLjJiOTNjZjZhYzlhZSAxMDA2NDQKLS0tIGEvbW0vbW11X2dh
dGhlci5jCisrKyBiL21tL21tdV9nYXRoZXIuYwpAQCAtMTksOCArMTksOCBAQCBzdGF0aWMgYm9v
bCB0bGJfbmV4dF9iYXRjaChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiKQogewogCXN0cnVjdCBtbXVf
Z2F0aGVyX2JhdGNoICpiYXRjaDsKIAotCS8qIE5vIG1vcmUgYmF0Y2hpbmcgaWYgd2UgaGF2ZSBk
ZWxheWVkIHJtYXBzIHBlbmRpbmcgKi8KLQlpZiAodGxiLT5kZWxheWVkX3JtYXApCisJLyogTGlt
aXQgYmF0Y2hpbmcgaWYgd2UgaGF2ZSBkZWxheWVkIHJtYXBzIHBlbmRpbmcgKi8KKwlpZiAodGxi
LT5kZWxheWVkX3JtYXAgJiYgdGxiLT5hY3RpdmUgIT0gJnRsYi0+bG9jYWwpCiAJCXJldHVybiBm
YWxzZTsKIAogCWJhdGNoID0gdGxiLT5hY3RpdmU7CkBAIC00OCwzMSArNDgsMzUgQEAgc3RhdGlj
IGJvb2wgdGxiX25leHRfYmF0Y2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYikKIH0KIAogI2lmZGVm
IENPTkZJR19TTVAKK3N0YXRpYyB2b2lkIHRsYl9mbHVzaF9ybWFwX2JhdGNoKHN0cnVjdCBtbXVf
Z2F0aGVyX2JhdGNoICpiYXRjaCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCit7CisJZm9y
IChpbnQgaSA9IDA7IGkgPCBiYXRjaC0+bnI7IGkrKykgeworCQlzdHJ1Y3QgZW5jb2RlZF9wYWdl
ICplbmMgPSBiYXRjaC0+ZW5jb2RlZF9wYWdlc1tpXTsKKworCQlpZiAoZW5jb2RlZF9wYWdlX2Zs
YWdzKGVuYykpIHsKKwkJCXN0cnVjdCBwYWdlICpwYWdlID0gZW5jb2RlZF9wYWdlX3B0cihlbmMp
OworCQkJcGFnZV9yZW1vdmVfcm1hcChwYWdlLCB2bWEsIGZhbHNlKTsKKwkJfQorCX0KK30KKwog
LyoqCiAgKiB0bGJfZmx1c2hfcm1hcHMgLSBkbyBwZW5kaW5nIHJtYXAgcmVtb3ZhbHMgYWZ0ZXIg
d2UgaGF2ZSBmbHVzaGVkIHRoZSBUTEIKICAqIEB0bGI6IHRoZSBjdXJyZW50IG1tdV9nYXRoZXIK
ICAqCiAgKiBOb3RlIHRoYXQgYmVjYXVzZSBvZiBob3cgdGxiX25leHRfYmF0Y2goKSBhYm92ZSB3
b3Jrcywgd2Ugd2lsbAotICogbmV2ZXIgc3RhcnQgbmV3IGJhdGNoZXMgd2l0aCBwZW5kaW5nIGRl
bGF5ZWQgcm1hcHMsIHNvIHdlIG9ubHkKLSAqIG5lZWQgdG8gd2FsayB0aHJvdWdoIHRoZSBjdXJy
ZW50IGFjdGl2ZSBiYXRjaC4KKyAqIG5ldmVyIHN0YXJ0IG11bHRpcGxlIG5ldyBiYXRjaGVzIHdp
dGggcGVuZGluZyBkZWxheWVkIHJtYXBzLCBzbworICogd2Ugb25seSBuZWVkIHRvIHdhbGsgdGhy
b3VnaCB0aGUgY3VycmVudCBhY3RpdmUgYmF0Y2ggYW5kIHRoZQorICogb3JpZ2luYWwgbG9jYWwg
b25lLgogICovCiB2b2lkIHRsYl9mbHVzaF9ybWFwcyhzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKLQlzdHJ1Y3QgbW11X2dhdGhlcl9iYXRjaCAq
YmF0Y2g7Ci0KIAlpZiAoIXRsYi0+ZGVsYXllZF9ybWFwKQogCQlyZXR1cm47CiAKLQliYXRjaCA9
IHRsYi0+YWN0aXZlOwotCWZvciAoaW50IGkgPSAwOyBpIDwgYmF0Y2gtPm5yOyBpKyspIHsKLQkJ
c3RydWN0IGVuY29kZWRfcGFnZSAqZW5jID0gYmF0Y2gtPmVuY29kZWRfcGFnZXNbaV07Ci0KLQkJ
aWYgKGVuY29kZWRfcGFnZV9mbGFncyhlbmMpKSB7Ci0JCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IGVu
Y29kZWRfcGFnZV9wdHIoZW5jKTsKLQkJCXBhZ2VfcmVtb3ZlX3JtYXAocGFnZSwgdm1hLCBmYWxz
ZSk7Ci0JCX0KLQl9Ci0KKwl0bGJfZmx1c2hfcm1hcF9iYXRjaCgmdGxiLT5sb2NhbCwgdm1hKTsK
KwlpZiAodGxiLT5hY3RpdmUgIT0gJnRsYi0+bG9jYWwpCisJCXRsYl9mbHVzaF9ybWFwX2JhdGNo
KHRsYi0+YWN0aXZlLCB2bWEpOwogCXRsYi0+ZGVsYXllZF9ybWFwID0gMDsKIH0KICNlbmRpZgot
LSAKMi4zOC4xLjI4NC5nZmQ5NDY4ZDc4NwoK
--00000000000025d1ff05ef429ef6--
