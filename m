Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1517613A
	for <oe-lkp@lists.linux.dev>; Tue,  4 Jul 2023 14:12:44 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso8982293e87.0
        for <oe-lkp@lists.linux.dev>; Tue, 04 Jul 2023 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688479962; x=1691071962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3So2gYeZeNuR/2q5MlAFdt4BonOt1PCCLvQw80QmelA=;
        b=VMYVeQ/3aOo2t7q5I2qhzWvMI1BoQTPHN1dTxFMKqSuI+BTcu/l9Rp4m2ZZwGpXclf
         suVev63/PkXCAXBzad/rOT+DokjOk76HpR3M8An9Z8331TIOHDz0nAfHZyJ+cOreIj9F
         NLPX+0s4cwWM3S/No8zcIOzWq7bzSxwXVhCSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479962; x=1691071962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3So2gYeZeNuR/2q5MlAFdt4BonOt1PCCLvQw80QmelA=;
        b=F+whgofggBaLRWE+ASOBVWeqAFMxLn48r2wacisHdZgla+vstQcNnDlFhhQMb4rpaR
         ptgaC0tCJk4L8EQLpi/fWaGQzsu/PH1J2IoT5aNBWUqPWQ+r0KDLecmtJ40pXF9hSOY/
         diNK4nV2ZbpLrpJ1e2JKKNqQsHsVXa5VAk/+v4w4AuUwTk3/F7lOGJBen3ifheHUHkVv
         yBVDa9Y8B7uDBj8gHghEJlD4O3mwrwV+jscQFRU9DD/lJ3POfXZJvnWVDFgKONWq4n1d
         vcstTwMfvcQPM8eSKXG27YhBnw7mkvKMA/Pd5TXRSYnRD3OlCby/QjobEr8dCvT5uDY8
         /uIA==
X-Gm-Message-State: ABy/qLaXKx/Vgqjm5Px3ddf3HQ1+hvcy939qYmzgtoHNOEMN1cN+7Ryd
	xAgMdsUezLhzDE0J91UNihEahjAdRd83ORhnKdTpb4A9
X-Google-Smtp-Source: APBJJlF8h9fFUdbIpqucvYzd81MiHtAfZ/A+/sf0bqAiYb6ouFGOittUVnUFHrOttO9P27mjuprh4Q==
X-Received: by 2002:ac2:5059:0:b0:4fb:7c94:b3e4 with SMTP id a25-20020ac25059000000b004fb7c94b3e4mr8746612lfm.29.1688479962122;
        Tue, 04 Jul 2023 07:12:42 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id r6-20020a19ac46000000b004fbb6c5b744sm819758lfc.103.2023.07.04.07.12.41
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 07:12:41 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso243265e87.2
        for <oe-lkp@lists.linux.dev>; Tue, 04 Jul 2023 07:12:41 -0700 (PDT)
X-Received: by 2002:a05:6512:2386:b0:4fb:763c:af54 with SMTP id
 c6-20020a056512238600b004fb763caf54mr11708321lfv.62.1688479961179; Tue, 04
 Jul 2023 07:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307041023.bcdbbfc0-oliver.sang@intel.com>
In-Reply-To: <202307041023.bcdbbfc0-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jul 2023 07:12:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Nb4t-JH6BGE5TOynik=-0kXyBGi3bLKTA85rvqHngQ@mail.gmail.com>
Message-ID: <CAHk-=wi3Nb4t-JH6BGE5TOynik=-0kXyBGi3bLKTA85rvqHngQ@mail.gmail.com>
Subject: Re: [linus:master] [gup] a425ac5365: WARNING:at_mm/gup.c:#__get_user_pages
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: multipart/mixed; boundary="0000000000004cc04805ffa9e054"

--0000000000004cc04805ffa9e054
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jul 2023 at 00:03, kernel test robot <oliver.sang@intel.com> wrote:
>
> we noticed this commit 'add a (temporary) warning' for the case that
> 'anybody actually does anything quite this strange'.
> and in our this test, the warning hits. just FYI.

Yeah, so it looks like this is trinity doing system calls with random
arguments, and that will obviously hit the whole

  "GUP will no longer expand the stack, warn if somebody seems to want
to do GUP under the stack"

test.

So then it will warn if somebody passes in bogus addresses that *used*
to maybe work.

But with a random argument tester like trinity, passing in random
bogus addresses is obviously expected, so the warning will trigger
even if it's not something that we would not want to keep working.

I do not have a good idea for how to not warn for things like syzbot
and trinity that do random system calls, and only warn for any
potential real applications that do crazy things and expect them to
work.

And I *do* want the backtrace from the warning (in this case, it shows
that it's the "process_vm_readv/writev()" path, which actually might
be worth adding stack expansion to, the same way __access_remote_vm()
does).

I guess I can do the limiting manually, and just avoid WARN_ON_ONCE().

If I do just "dump_stack()", will the kernel test robot react to that
too? IOW, would a patch like the attached make the kernel test robot
not react?

              Linus

--0000000000004cc04805ffa9e054
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ljodbtsf0>
X-Attachment-Id: f_ljodbtsf0

IG1tL2d1cC5jIHwgMTggKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3Vw
LmMKaW5kZXggZWYyOTY0MTY3MWM3Li5jOWQ3OTlkMjhkZTcgMTAwNjQ0Ci0tLSBhL21tL2d1cC5j
CisrKyBiL21tL2d1cC5jCkBAIC0xMDkxLDYgKzEwOTEsMjEgQEAgc3RhdGljIGludCBjaGVja192
bWFfZmxhZ3Moc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgZ3VwX2Zs
YWdzKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBndXBfc3RhY2tfZXhwYW5zaW9uX3dh
cm5pbmcoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCisJdW5zaWduZWQgbG9uZyBh
ZGRyKQoreworCXN0YXRpYyB2b2xhdGlsZSB1bnNpZ25lZCBsb25nIG5leHRfd2FybjsKKwl1bnNp
Z25lZCBsb25nIG5vdyA9IGppZmZpZXMsIG5leHQgPSBuZXh0X3dhcm47CisKKwkvKiBMZXQncyBu
b3Qgd2FybiBtb3JlIHRoYW4gb25jZSBhbiBob3VyLi4gKi8KKwlpZiAobmV4dCAmJiB0aW1lX2Jl
Zm9yZShub3csIG5leHQpKQorCQlyZXR1cm47CisJbmV4dF93YXJuID0gbm93ICsgNjAqNjAqSFo7
CisJcHJfd2FybigiR1VQIG5vIGxvbmdlciBncm93cyB0aGUgc3RhY2sgJWx4LSVseCAoJWx4KVxu
IiwKKwkJdm1hLT52bV9zdGFydCwgdm1hLT52bV9lbmQsIGFkZHIpOworCWR1bXBfc3RhY2soKTsK
K30KKwogLyoqCiAgKiBfX2dldF91c2VyX3BhZ2VzKCkgLSBwaW4gdXNlciBwYWdlcyBpbiBtZW1v
cnkKICAqIEBtbToJCW1tX3N0cnVjdCBvZiB0YXJnZXQgbW0KQEAgLTExNzAsNyArMTE4NSw4IEBA
IHN0YXRpYyBsb25nIF9fZ2V0X3VzZXJfcGFnZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCWlm
ICghdm1hIHx8IHN0YXJ0ID49IHZtYS0+dm1fZW5kKSB7CiAJCQl2bWEgPSBmaW5kX3ZtYShtbSwg
c3RhcnQpOwogCQkJaWYgKHZtYSAmJiAoc3RhcnQgPCB2bWEtPnZtX3N0YXJ0KSkgewotCQkJCVdB
Uk5fT05fT05DRSh2bWEtPnZtX2ZsYWdzICYgVk1fR1JPV1NET1dOKTsKKwkJCQlpZiAodW5saWtl
bHkodm1hLT52bV9mbGFncyAmIFZNX0dST1dTRE9XTikpCisJCQkJCWd1cF9zdGFja19leHBhbnNp
b25fd2FybmluZyh2bWEsIHN0YXJ0KTsKIAkJCQl2bWEgPSBOVUxMOwogCQkJfQogCQkJaWYgKCF2
bWEgJiYgaW5fZ2F0ZV9hcmVhKG1tLCBzdGFydCkpIHsK
--0000000000004cc04805ffa9e054--
