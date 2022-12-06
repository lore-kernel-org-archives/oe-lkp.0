Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E227738
	for <oe-lkp@lists.linux.dev>; Tue,  6 Dec 2022 19:15:30 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id k3so1909955qki.13
        for <oe-lkp@lists.linux.dev>; Tue, 06 Dec 2022 11:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnGWoKHFGdZxHMe2dZN8RBXvrycHdsx4LKGoPPTB4Iw=;
        b=hklI08rfbO3som41CfZAYKfsT3DKY7Ra5mQdalinR/hIgnXgZ7M2uQuZomwbBxuoSO
         9kwfm/ODxhwIInV5EzbWrr91LoRHJlHyF7vuQRiY5BYryFnMKGCw56Eh1c84zYS3TDZE
         oqLibvXUF0gudWLjrQLb0v7l8OWmqTYXIDWUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnGWoKHFGdZxHMe2dZN8RBXvrycHdsx4LKGoPPTB4Iw=;
        b=7sxst3oEmbElMi/15yQEsiAGLXd+2iZ40N285erk4ayIoxh6Pj/Bjz+kUAFU7VtNmZ
         JeOXPhsK9K2UR/tm9QWJ9P1RNKBlqZPWDMmtoUA9dEWq5w54r4claq2Ac75jbzvW3BBg
         /n1HBcsP0dnv3ZvZgrv0/ceFyV2lO/Vyk+68nVhJ3oYPHR+ipoK1h9wL889Nemgbhd1i
         WLRIDBu3hEdtnkPStVpg5Ubn3FDtcHi3GzEaz2OJzTCE1mniH1lNn+MwkDqxNt1mMz++
         ffoH+HMZf4Y1oHs/+cG7j5Ps/CeiX29wGf4Y900U+fwYS627ksucV1tgVb6HXGV1EpE+
         UWlA==
X-Gm-Message-State: ANoB5plrSKLs1Xu2qYg3xbjCsnyD5uscfQlRaiC5jbvxMz2Bxkpf3TnY
	6fHHRkCqq7nbfCTLd5d6svYbKBITn6c3lAQB
X-Google-Smtp-Source: AA0mqf6Pwxgg9KNfs8VZJhxtI/egbF9BqaLT66Qg0Y51Vx4RTVhUhulfF/h3yQvygDZAfsrvSMKJAA==
X-Received: by 2002:a37:8882:0:b0:6fe:c477:5140 with SMTP id k124-20020a378882000000b006fec4775140mr6861785qkd.179.1670354128841;
        Tue, 06 Dec 2022 11:15:28 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id az15-20020a05620a170f00b006ce1bfbd603sm14977253qkb.124.2022.12.06.11.15.25
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 11:15:26 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id p18so8320527qkg.2
        for <oe-lkp@lists.linux.dev>; Tue, 06 Dec 2022 11:15:25 -0800 (PST)
X-Received: by 2002:a37:8883:0:b0:6fb:628a:1aea with SMTP id
 k125-20020a378883000000b006fb628a1aeamr78661848qkd.697.1670354125497; Tue, 06
 Dec 2022 11:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051534.852804af-yujie.liu@intel.com> <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com>
 <87ilipffws.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
In-Reply-To: <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Dec 2022 11:15:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whjis-wTZKH20xoBW3=1qyygYoxJORxXx8ZpJbc6KtROw@mail.gmail.com>
Message-ID: <CAHk-=whjis-wTZKH20xoBW3=1qyygYoxJORxXx8ZpJbc6KtROw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 5df397dec7: will-it-scale.per_thread_ops
 -53.3% regression
To: "Huang, Ying" <ying.huang@intel.com>
Cc: kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arch@vger.kernel.org, feng.tang@intel.com, 
	zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: multipart/mixed; boundary="0000000000004cfd6505ef2da0b7"

--0000000000004cfd6505ef2da0b7
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 10:41 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Let me think about this a while, but I think I'll have a patch for you
> to test once I've dealt with a couple more pull requests.

So here's a trial balloon for you to try if you can see if this mostly
fixes the regression..

It still limits batching (because unlike the full "gather pages until
you have to flush", this is all batched under the page table lock. But
it limits it a bit less, in that it will use a second active batch if
it only used the initial on-stack one (which is called "local", which
is not a great name in this context, but whatever).

This _should_ mean that that benchmark will now batch ~512 pages
instead of just 8.

Which should be pretty much what it effectively used to do before too,
because the dirty shared page case has always caused that
"force_flush" thing, so it will have always stopped to flush every
page directory.

(But we still have that extra rmap flushing limit because there could
have been _previous_ buffered page pointers that weren't dirty shared
pages, and we don't want to have to deal with that pain, and might
have to exit early in order to avoid it)

I can imagine cleaner ways to do this, but they would involve having
to remember which batch we started having dirty pages in, which is
more bookkeeping pain than I really think it's worth.

Does this fix the regression?

             Linus

--0000000000004cfd6505ef2da0b7
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lbclpeas0>
X-Attachment-Id: f_lbclpeas0

IG1tL21tdV9nYXRoZXIuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21tL21tdV9nYXRoZXIuYyBiL21tL21tdV9nYXRoZXIuYwppbmRleCA4MjQ3NTUz
YTY5YzIuLjJiOTNjZjZhYzlhZSAxMDA2NDQKLS0tIGEvbW0vbW11X2dhdGhlci5jCisrKyBiL21t
L21tdV9nYXRoZXIuYwpAQCAtMTksOCArMTksOCBAQCBzdGF0aWMgYm9vbCB0bGJfbmV4dF9iYXRj
aChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiKQogewogCXN0cnVjdCBtbXVfZ2F0aGVyX2JhdGNoICpi
YXRjaDsKIAotCS8qIE5vIG1vcmUgYmF0Y2hpbmcgaWYgd2UgaGF2ZSBkZWxheWVkIHJtYXBzIHBl
bmRpbmcgKi8KLQlpZiAodGxiLT5kZWxheWVkX3JtYXApCisJLyogTGltaXQgYmF0Y2hpbmcgaWYg
d2UgaGF2ZSBkZWxheWVkIHJtYXBzIHBlbmRpbmcgKi8KKwlpZiAodGxiLT5kZWxheWVkX3JtYXAg
JiYgdGxiLT5hY3RpdmUgIT0gJnRsYi0+bG9jYWwpCiAJCXJldHVybiBmYWxzZTsKIAogCWJhdGNo
ID0gdGxiLT5hY3RpdmU7CkBAIC00OCwzMSArNDgsMzUgQEAgc3RhdGljIGJvb2wgdGxiX25leHRf
YmF0Y2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYikKIH0KIAogI2lmZGVmIENPTkZJR19TTVAKK3N0
YXRpYyB2b2lkIHRsYl9mbHVzaF9ybWFwX2JhdGNoKHN0cnVjdCBtbXVfZ2F0aGVyX2JhdGNoICpi
YXRjaCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCit7CisJZm9yIChpbnQgaSA9IDA7IGkg
PCBiYXRjaC0+bnI7IGkrKykgeworCQlzdHJ1Y3QgZW5jb2RlZF9wYWdlICplbmMgPSBiYXRjaC0+
ZW5jb2RlZF9wYWdlc1tpXTsKKworCQlpZiAoZW5jb2RlZF9wYWdlX2ZsYWdzKGVuYykpIHsKKwkJ
CXN0cnVjdCBwYWdlICpwYWdlID0gZW5jb2RlZF9wYWdlX3B0cihlbmMpOworCQkJcGFnZV9yZW1v
dmVfcm1hcChwYWdlLCB2bWEsIGZhbHNlKTsKKwkJfQorCX0KK30KKwogLyoqCiAgKiB0bGJfZmx1
c2hfcm1hcHMgLSBkbyBwZW5kaW5nIHJtYXAgcmVtb3ZhbHMgYWZ0ZXIgd2UgaGF2ZSBmbHVzaGVk
IHRoZSBUTEIKICAqIEB0bGI6IHRoZSBjdXJyZW50IG1tdV9nYXRoZXIKICAqCiAgKiBOb3RlIHRo
YXQgYmVjYXVzZSBvZiBob3cgdGxiX25leHRfYmF0Y2goKSBhYm92ZSB3b3Jrcywgd2Ugd2lsbAot
ICogbmV2ZXIgc3RhcnQgbmV3IGJhdGNoZXMgd2l0aCBwZW5kaW5nIGRlbGF5ZWQgcm1hcHMsIHNv
IHdlIG9ubHkKLSAqIG5lZWQgdG8gd2FsayB0aHJvdWdoIHRoZSBjdXJyZW50IGFjdGl2ZSBiYXRj
aC4KKyAqIG5ldmVyIHN0YXJ0IG11bHRpcGxlIG5ldyBiYXRjaGVzIHdpdGggcGVuZGluZyBkZWxh
eWVkIHJtYXBzLCBzbworICogd2Ugb25seSBuZWVkIHRvIHdhbGsgdGhyb3VnaCB0aGUgY3VycmVu
dCBhY3RpdmUgYmF0Y2ggYW5kIHRoZQorICogb3JpZ2luYWwgbG9jYWwgb25lLgogICovCiB2b2lk
IHRsYl9mbHVzaF9ybWFwcyhzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKIHsKLQlzdHJ1Y3QgbW11X2dhdGhlcl9iYXRjaCAqYmF0Y2g7Ci0KIAlpZiAo
IXRsYi0+ZGVsYXllZF9ybWFwKQogCQlyZXR1cm47CiAKLQliYXRjaCA9IHRsYi0+YWN0aXZlOwot
CWZvciAoaW50IGkgPSAwOyBpIDwgYmF0Y2gtPm5yOyBpKyspIHsKLQkJc3RydWN0IGVuY29kZWRf
cGFnZSAqZW5jID0gYmF0Y2gtPmVuY29kZWRfcGFnZXNbaV07Ci0KLQkJaWYgKGVuY29kZWRfcGFn
ZV9mbGFncyhlbmMpKSB7Ci0JCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IGVuY29kZWRfcGFnZV9wdHIo
ZW5jKTsKLQkJCXBhZ2VfcmVtb3ZlX3JtYXAocGFnZSwgdm1hLCBmYWxzZSk7Ci0JCX0KLQl9Ci0K
Kwl0bGJfZmx1c2hfcm1hcF9iYXRjaCgmdGxiLT5sb2NhbCwgdm1hKTsKKwlpZiAodGxiLT5hY3Rp
dmUgIT0gJnRsYi0+bG9jYWwpCisJCXRsYl9mbHVzaF9ybWFwX2JhdGNoKHRsYi0+YWN0aXZlLCB2
bWEpOwogCXRsYi0+ZGVsYXllZF9ybWFwID0gMDsKIH0KICNlbmRpZgo=
--0000000000004cfd6505ef2da0b7--
