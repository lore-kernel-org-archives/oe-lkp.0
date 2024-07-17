Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59BC1E526
	for <oe-lkp@lists.linux.dev>; Wed, 17 Jul 2024 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721231115; cv=none; b=to+dqZ6EiU5voi1QXRSorXtSLpkzwzpJ/QdS1GZTOl5gI77XucuVVOQboo3fJuFINk2zNKSiUDWti3tT2wrLPxpDxu+OnOOiRwh7oZJGHJfakpAfaqwMb2op43o5ozsUtvsw20cf6siG4ZYrNBy5uRz4K8sZz4Fpd/fSAgR1Dg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721231115; c=relaxed/simple;
	bh=MBp+Bmth2ZWwg/PZPzya+EQtCmzlAfbaVtfbu2Ze9d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhuSrOLdUxoAEaL+uzPnt7f36NurjOrka/4QztYs5smzS9iDLosmCNEsRx4bnPhmnEwqug0Cho42rBpNEfbqw3kZ+OsJoU7y60pdmtmVqTfvvb5a/lOwb93RK3UyMT1Vf0y79zKzlxJi+BRdW50zzbkLsTAroOrIm74+TNrwow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZwXEfSg; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZwXEfSg"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-447f8aa87bfso442731cf.0
        for <oe-lkp@lists.linux.dev>; Wed, 17 Jul 2024 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721231112; x=1721835912; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VyYCHarI4DJS4n9C5rPL1QzXgph0m3K+jlOkyRJNsok=;
        b=aZwXEfSggyNrIPg3ctWiv1mEngZT1KEj0lTV40+iyoL6aoEjILbX8Gx66QvxfvkkFH
         yHApWJNh40HKEiThthFW64228+Im9FnElj19fPFT9RNBMeO1ZR5mxdi818Y/5E4qqLRr
         lIY5lFhl61/IBKnWxlUXdwNF3mvKKbzu1xRQ+kefAmcnWtcjL2ah61t3coAv95FUOjH8
         zveOOVQo2y2CsVDdi7iZA9Ax4f3yd/FspwS0hbfxKyjNT0x9IZFGFnJzN4vW3M6Qm9ST
         pzzT/1/wa8vMID+aAHTDX6SojcPvVTl5av4QhlbSi1psrb54wvvTHDyjdQ+zxRz96ys7
         bDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721231112; x=1721835912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyYCHarI4DJS4n9C5rPL1QzXgph0m3K+jlOkyRJNsok=;
        b=LnYlH2QngQBxrOxsl47iu68f1gEjH7lOoyNH4k0geB5LPxIJqpRY+zDRXvwEi7sMtL
         2ANaAIoJ/dh1BuiwXxwvvkOnuerxvrb/7/d5/EzoKfyA8ESfooF3DCjJYqJACIe7OuLr
         p700zQefOAI7hoXF1DEG85bLrA3uZkgygMvH9rfZv0renZQnk40tZjWxExxYWPH8uTp/
         WuShqQK5shywAG0xS4AcyODZswkQB76KESvGDYFKIvQ63LH9jtegKdPjf/hv5lC9K+oy
         mNaaHD2cA07cVmjlItECNHKJFUR5/sulE7kyGWwtkf0wYy9y5A7c7T+BJillHsa2P8JX
         Md2A==
X-Gm-Message-State: AOJu0YxPzAMPaPHttuvPgGi5L7Rdi41wZxW8hpcKntz1B3QKP+sdSKMJ
	LfqiTygYxdBicXNMWEXH9XuA5PkYDKW1iH/vow1tWJqsjF3pG+3uUEJo3iNW7sz80cUt2dYUrge
	XezaSTnXCxGnVOgP3Ek8xFJBtm5DHkZvAXvah
X-Google-Smtp-Source: AGHT+IGm2i/UM4uooHn47/a7C2rIGadzvy6TrIT6gP08rFUmxmVZ+PzTmB0jX4cFX+snI4LmHwesFmZLzCn5oymswY0=
X-Received: by 2002:a05:622a:1b09:b0:447:e497:95d0 with SMTP id
 d75a77b69052e-44f84d14b24mr2845121cf.17.1721231112300; Wed, 17 Jul 2024
 08:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407091001.1250ad4a-oliver.sang@intel.com> <3acefad9-96e5-4681-8014-827d6be71c7a@linux.ibm.com>
 <CAOUHufYvCeiGGa+3PbPDfFx__aV2XxyS7TMHMicws4aNTg4qmQ@mail.gmail.com>
In-Reply-To: <CAOUHufYvCeiGGa+3PbPDfFx__aV2XxyS7TMHMicws4aNTg4qmQ@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 17 Jul 2024 09:44:33 -0600
Message-ID: <CAOUHufaO-hxdEJZtdN-5EHEs-wOJoGQ1pVGeHaa89L7hSz8grQ@mail.gmail.com>
Subject: Re: [linux-next:master] [mm/hugetlb_vmemmap] 875fa64577:
 vm-scalability.throughput -34.3% regression
To: Janosch Frank <frankja@linux.ibm.com>, kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Frank van der Linden <fvdl@google.com>, Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>, 
	Yang Shi <yang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Marc Hartmayer <mhartmay@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: multipart/mixed; boundary="000000000000072063061d735905"

--000000000000072063061d735905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 2:36=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote:
>
> Hi Janosch and Oliver,
>
> On Wed, Jul 17, 2024 at 1:57=E2=80=AFAM Janosch Frank <frankja@linux.ibm.=
com> wrote:
> >
> > On 7/9/24 07:11, kernel test robot wrote:
> > > Hello,
> > >
> > > kernel test robot noticed a -34.3% regression of vm-scalability.throu=
ghput on:
> > >
> > >
> > > commit: 875fa64577da9bc8e9963ee14fef8433f20653e7 ("mm/hugetlb_vmemmap=
: fix race with speculative PFN walkers")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > [still regression on linux-next/master 0b58e108042b0ed28a71cd7edf5175=
999955b233]
> > >
> > This has hit s390 huge page backed KVM guests as well.
> > Our simple start/stop test case went from ~5 to over 50 seconds of runt=
ime.
>
> Could you try the attached patch please? Thank you.

Thanks, Yosry, for spotting the following typo:
  flags &=3D VMEMMAP_SYNCHRONIZE_RCU;
It's supposed to be:
  flags &=3D ~VMEMMAP_SYNCHRONIZE_RCU;

Reattaching v2 with the above typo fixed. Please let me know, Janosch & Oli=
ver.

--000000000000072063061d735905
Content-Type: application/octet-stream; name="hugetlb-fix-v2.patch"
Content-Disposition: attachment; filename="hugetlb-fix-v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyq0itn30>
X-Attachment-Id: f_lyq0itn30

ZGlmZiAtLWdpdCBhL21tL2h1Z2V0bGJfdm1lbW1hcC5jIGIvbW0vaHVnZXRsYl92bWVtbWFwLmMK
aW5kZXggODE5MzkwNjUxNWM2Li45ZTZmYzRjZThkMmIgMTAwNjQ0Ci0tLSBhL21tL2h1Z2V0bGJf
dm1lbW1hcC5jCisrKyBiL21tL2h1Z2V0bGJfdm1lbW1hcC5jCkBAIC00Myw2ICs0Myw4IEBAIHN0
cnVjdCB2bWVtbWFwX3JlbWFwX3dhbGsgewogI2RlZmluZSBWTUVNTUFQX1NQTElUX05PX1RMQl9G
TFVTSAlCSVQoMCkKIC8qIFNraXAgdGhlIFRMQiBmbHVzaCB3aGVuIHdlIHJlbWFwIHRoZSBQVEUg
Ki8KICNkZWZpbmUgVk1FTU1BUF9SRU1BUF9OT19UTEJfRkxVU0gJQklUKDEpCisvKiBzeW5jaHJv
bml6ZV9yY3UoKSB0byBhdm9pZCB3cml0ZXMgZnJvbSBwYWdlX3JlZl9hZGRfdW5sZXNzKCkgKi8K
KyNkZWZpbmUgVk1FTU1BUF9TWU5DSFJPTklaRV9SQ1UJCUJJVCgyKQogCXVuc2lnbmVkIGxvbmcJ
CWZsYWdzOwogfTsKIApAQCAtNDUxLDYgKzQ1Myw5IEBAIHN0YXRpYyBpbnQgX19odWdldGxiX3Zt
ZW1tYXBfcmVzdG9yZV9mb2xpbyhjb25zdCBzdHJ1Y3QgaHN0YXRlICpoLAogCWlmICghZm9saW9f
dGVzdF9odWdldGxiX3ZtZW1tYXBfb3B0aW1pemVkKGZvbGlvKSkKIAkJcmV0dXJuIDA7CiAKKwlp
ZiAoZmxhZ3MgJiBWTUVNTUFQX1NZTkNIUk9OSVpFX1JDVSkKKwkJc3luY2hyb25pemVfcmN1KCk7
CisKIAl2bWVtbWFwX2VuZAk9IHZtZW1tYXBfc3RhcnQgKyBodWdldGxiX3ZtZW1tYXBfc2l6ZSho
KTsKIAl2bWVtbWFwX3JldXNlCT0gdm1lbW1hcF9zdGFydDsKIAl2bWVtbWFwX3N0YXJ0CSs9IEhV
R0VUTEJfVk1FTU1BUF9SRVNFUlZFX1NJWkU7CkBAIC00ODMsMTAgKzQ4OCw3IEBAIHN0YXRpYyBp
bnQgX19odWdldGxiX3ZtZW1tYXBfcmVzdG9yZV9mb2xpbyhjb25zdCBzdHJ1Y3QgaHN0YXRlICpo
LAogICovCiBpbnQgaHVnZXRsYl92bWVtbWFwX3Jlc3RvcmVfZm9saW8oY29uc3Qgc3RydWN0IGhz
dGF0ZSAqaCwgc3RydWN0IGZvbGlvICpmb2xpbykKIHsKLQkvKiBhdm9pZCB3cml0ZXMgZnJvbSBw
YWdlX3JlZl9hZGRfdW5sZXNzKCkgd2hpbGUgdW5mb2xkaW5nIHZtZW1tYXAgKi8KLQlzeW5jaHJv
bml6ZV9yY3UoKTsKLQotCXJldHVybiBfX2h1Z2V0bGJfdm1lbW1hcF9yZXN0b3JlX2ZvbGlvKGgs
IGZvbGlvLCAwKTsKKwlyZXR1cm4gX19odWdldGxiX3ZtZW1tYXBfcmVzdG9yZV9mb2xpbyhoLCBm
b2xpbywgVk1FTU1BUF9TWU5DSFJPTklaRV9SQ1UpOwogfQogCiAvKioKQEAgLTUwOSwxNCArNTEx
LDEzIEBAIGxvbmcgaHVnZXRsYl92bWVtbWFwX3Jlc3RvcmVfZm9saW9zKGNvbnN0IHN0cnVjdCBo
c3RhdGUgKmgsCiAJc3RydWN0IGZvbGlvICpmb2xpbywgKnRfZm9saW87CiAJbG9uZyByZXN0b3Jl
ZCA9IDA7CiAJbG9uZyByZXQgPSAwOwotCi0JLyogYXZvaWQgd3JpdGVzIGZyb20gcGFnZV9yZWZf
YWRkX3VubGVzcygpIHdoaWxlIHVuZm9sZGluZyB2bWVtbWFwICovCi0Jc3luY2hyb25pemVfcmN1
KCk7CisJdW5zaWduZWQgbG9uZyBmbGFncyA9IFZNRU1NQVBfUkVNQVBfTk9fVExCX0ZMVVNIIHwg
Vk1FTU1BUF9TWU5DSFJPTklaRV9SQ1U7CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZm9s
aW8sIHRfZm9saW8sIGZvbGlvX2xpc3QsIGxydSkgewogCQlpZiAoZm9saW9fdGVzdF9odWdldGxi
X3ZtZW1tYXBfb3B0aW1pemVkKGZvbGlvKSkgewotCQkJcmV0ID0gX19odWdldGxiX3ZtZW1tYXBf
cmVzdG9yZV9mb2xpbyhoLCBmb2xpbywKLQkJCQkJCQkgICAgICBWTUVNTUFQX1JFTUFQX05PX1RM
Ql9GTFVTSCk7CisJCQlyZXQgPSBfX2h1Z2V0bGJfdm1lbW1hcF9yZXN0b3JlX2ZvbGlvKGgsIGZv
bGlvLCBmbGFncyk7CisJCQlmbGFncyAmPSB+Vk1FTU1BUF9TWU5DSFJPTklaRV9SQ1U7CisKIAkJ
CWlmIChyZXQpCiAJCQkJYnJlYWs7CiAJCQlyZXN0b3JlZCsrOwpAQCAtNTY0LDYgKzU2NSw5IEBA
IHN0YXRpYyBpbnQgX19odWdldGxiX3ZtZW1tYXBfb3B0aW1pemVfZm9saW8oY29uc3Qgc3RydWN0
IGhzdGF0ZSAqaCwKIAkJcmV0dXJuIHJldDsKIAogCXN0YXRpY19icmFuY2hfaW5jKCZodWdldGxi
X29wdGltaXplX3ZtZW1tYXBfa2V5KTsKKworCWlmIChmbGFncyAmIFZNRU1NQVBfU1lOQ0hST05J
WkVfUkNVKQorCQlzeW5jaHJvbml6ZV9yY3UoKTsKIAkvKgogCSAqIFZlcnkgU3VidGxlCiAJICog
SWYgVk1FTU1BUF9SRU1BUF9OT19UTEJfRkxVU0ggaXMgc2V0LCBUTEIgZmx1c2hpbmcgaXMgbm90
IHBlcmZvcm1lZApAQCAtNjExLDEwICs2MTUsNyBAQCB2b2lkIGh1Z2V0bGJfdm1lbW1hcF9vcHRp
bWl6ZV9mb2xpbyhjb25zdCBzdHJ1Y3QgaHN0YXRlICpoLCBzdHJ1Y3QgZm9saW8gKmZvbGlvKQog
ewogCUxJU1RfSEVBRCh2bWVtbWFwX3BhZ2VzKTsKIAotCS8qIGF2b2lkIHdyaXRlcyBmcm9tIHBh
Z2VfcmVmX2FkZF91bmxlc3MoKSB3aGlsZSBmb2xkaW5nIHZtZW1tYXAgKi8KLQlzeW5jaHJvbml6
ZV9yY3UoKTsKLQotCV9faHVnZXRsYl92bWVtbWFwX29wdGltaXplX2ZvbGlvKGgsIGZvbGlvLCAm
dm1lbW1hcF9wYWdlcywgMCk7CisJX19odWdldGxiX3ZtZW1tYXBfb3B0aW1pemVfZm9saW8oaCwg
Zm9saW8sICZ2bWVtbWFwX3BhZ2VzLCBWTUVNTUFQX1NZTkNIUk9OSVpFX1JDVSk7CiAJZnJlZV92
bWVtbWFwX3BhZ2VfbGlzdCgmdm1lbW1hcF9wYWdlcyk7CiB9CiAKQEAgLTY0MSw2ICs2NDIsNyBA
QCB2b2lkIGh1Z2V0bGJfdm1lbW1hcF9vcHRpbWl6ZV9mb2xpb3Moc3RydWN0IGhzdGF0ZSAqaCwg
c3RydWN0IGxpc3RfaGVhZCAqZm9saW9fbAogewogCXN0cnVjdCBmb2xpbyAqZm9saW87CiAJTElT
VF9IRUFEKHZtZW1tYXBfcGFnZXMpOworCXVuc2lnbmVkIGxvbmcgZmxhZ3MgPSBWTUVNTUFQX1JF
TUFQX05PX1RMQl9GTFVTSCB8IFZNRU1NQVBfU1lOQ0hST05JWkVfUkNVOwogCiAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShmb2xpbywgZm9saW9fbGlzdCwgbHJ1KSB7CiAJCWludCByZXQgPSBodWdldGxi
X3ZtZW1tYXBfc3BsaXRfZm9saW8oaCwgZm9saW8pOwpAQCAtNjU3LDE0ICs2NTksMTEgQEAgdm9p
ZCBodWdldGxiX3ZtZW1tYXBfb3B0aW1pemVfZm9saW9zKHN0cnVjdCBoc3RhdGUgKmgsIHN0cnVj
dCBsaXN0X2hlYWQgKmZvbGlvX2wKIAogCWZsdXNoX3RsYl9hbGwoKTsKIAotCS8qIGF2b2lkIHdy
aXRlcyBmcm9tIHBhZ2VfcmVmX2FkZF91bmxlc3MoKSB3aGlsZSBmb2xkaW5nIHZtZW1tYXAgKi8K
LQlzeW5jaHJvbml6ZV9yY3UoKTsKLQogCWxpc3RfZm9yX2VhY2hfZW50cnkoZm9saW8sIGZvbGlv
X2xpc3QsIGxydSkgewogCQlpbnQgcmV0OwogCi0JCXJldCA9IF9faHVnZXRsYl92bWVtbWFwX29w
dGltaXplX2ZvbGlvKGgsIGZvbGlvLCAmdm1lbW1hcF9wYWdlcywKLQkJCQkJCSAgICAgICBWTUVN
TUFQX1JFTUFQX05PX1RMQl9GTFVTSCk7CisJCXJldCA9IF9faHVnZXRsYl92bWVtbWFwX29wdGlt
aXplX2ZvbGlvKGgsIGZvbGlvLCAmdm1lbW1hcF9wYWdlcywgZmxhZ3MpOworCQlmbGFncyAmPSB+
Vk1FTU1BUF9TWU5DSFJPTklaRV9SQ1U7CiAKIAkJLyoKIAkJICogUGFnZXMgdG8gYmUgZnJlZWQg
bWF5IGhhdmUgYmVlbiBhY2N1bXVsYXRlZC4gIElmIHdlCkBAIC02NzgsOCArNjc3LDcgQEAgdm9p
ZCBodWdldGxiX3ZtZW1tYXBfb3B0aW1pemVfZm9saW9zKHN0cnVjdCBoc3RhdGUgKmgsIHN0cnVj
dCBsaXN0X2hlYWQgKmZvbGlvX2wKIAkJCWZsdXNoX3RsYl9hbGwoKTsKIAkJCWZyZWVfdm1lbW1h
cF9wYWdlX2xpc3QoJnZtZW1tYXBfcGFnZXMpOwogCQkJSU5JVF9MSVNUX0hFQUQoJnZtZW1tYXBf
cGFnZXMpOwotCQkJX19odWdldGxiX3ZtZW1tYXBfb3B0aW1pemVfZm9saW8oaCwgZm9saW8sICZ2
bWVtbWFwX3BhZ2VzLAotCQkJCQkJCSBWTUVNTUFQX1JFTUFQX05PX1RMQl9GTFVTSCk7CisJCQlf
X2h1Z2V0bGJfdm1lbW1hcF9vcHRpbWl6ZV9mb2xpbyhoLCBmb2xpbywgJnZtZW1tYXBfcGFnZXMs
IGZsYWdzKTsKIAkJfQogCX0KIAo=
--000000000000072063061d735905--
