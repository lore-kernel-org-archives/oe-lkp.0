Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0496335B5
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706556275; cv=none; b=qhYYwF7zgEKJXTB5Q6c8OYC4G7GGgMIvcd++jbjISChNdS3L4FfOappfNJIAxV8lRGSpuw0LmmogMEMS7K5tvc5yk5wxUQtBT21RwxeCTwRq/+EHYSk0b5DyS1aZCJ/GD0vwVdFXwCKvtJkpVla2MVZcZ8aCSd8GB6Eewx1ytdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706556275; c=relaxed/simple;
	bh=bBpiX78LXMRXA22N7d+TRCKij7xbGDSODZmb19qcTVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uheDuM0qM9jtol9uYpBqlVTKqRpS1EIPe0C6+KnH/8lLsCvdiUPYLagEL5O3VoJH75QvxVGrt07DiOzn34hwf+DfydLEMOqmLFG00Z9QqqDfKwGqby1mgN9E7C4mGTMW7GC/Wt/3Is1SvOmL+p4HAFZ8Mx+3rmBb7CEEqDfd9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VRkcfbqn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VRkcfbqn"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51028acdcf0so3707663e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 11:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706556271; x=1707161071; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcYLqzXF8lziibesGlxqW2Lt27r28IgsPGcFjfsGXTQ=;
        b=VRkcfbqnIpGlt9XgbKENTdBiyp5u/6OKl3uOJUZW4FAtSAbOD9rzDHJcUBd+PNQJfl
         Wz3hY3GQNT4nrwPyhXAYm25ZfvrTlic1U2rQ+yOvLH5DuuISXWdaG0K8BbsHEUn04GXi
         JY1nLvIJoGMie5QHU25/fXyW5sXignbGZoTLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706556271; x=1707161071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcYLqzXF8lziibesGlxqW2Lt27r28IgsPGcFjfsGXTQ=;
        b=uQ2CfHKin5ofsCa6SfilmeFm6++ggpaAoeD43cBj7k7TGeqHGdqHJBW9bAvRdPl1kT
         Gb4l4V5UaEQyjBAXitd0ozooMqWO7AQQPDDs+Ve89UATgkPRp4B/Rg4fU7yWgL63Qlo0
         6PQwOUepy8xWWjkHckQwcdVdZbxZAienFtO8ZMAW2cy3ZY4OQaFkwuEIWlxDK5JNoUch
         BwgPFMVYqzclFbT48ShqaIgDdsenXQ3/zHIypg9dm6grqFR+nUmN/t8W91JFvAgFrpog
         xabr7JFQSzbMB1whwEquEuzx7YUy2E9iOKTHTilZL9Z7DJ09dVQYSkhHDTCDNJJNZCIl
         t3UA==
X-Gm-Message-State: AOJu0Yz8zArd/g6nRl1xTBuM5McPzG/21wZQvL9CJjdonixEfK74O8qy
	G6fmOdGMoXJIHLWfACk4fgdiOxx3OPUYOvjeMf1V09jtpZN0l07EYeuvBFbHMxdLH8ze5TA8Qg5
	7ZSw=
X-Google-Smtp-Source: AGHT+IFRLvYPPJjYRueyVX7ZN7kw7QvgSnlhuhIukBNmm8Oqoa0K9wPnzXaAt7NXxAbjFJckJaXNSA==
X-Received: by 2002:a05:6512:314f:b0:510:1bbc:96bb with SMTP id s15-20020a056512314f00b005101bbc96bbmr3913688lfi.24.1706556271636;
        Mon, 29 Jan 2024 11:24:31 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512046400b005101c7cd4e1sm1195233lfd.4.2024.01.29.11.24.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 11:24:29 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cf328885b4so35925341fa.3
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 11:24:29 -0800 (PST)
X-Received: by 2002:a2e:8342:0:b0:2cf:433c:b3e with SMTP id
 l2-20020a2e8342000000b002cf433c0b3emr4156643ljh.8.1706556269035; Mon, 29 Jan
 2024 11:24:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
In-Reply-To: <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 11:24:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
Message-ID: <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000035679f06101a980c"

--00000000000035679f06101a980c
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 09:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> IOW, I think the right fix is really just this:

Oh, for some reason I sent out the original patch I had which didn't
fix the create_dir() case.

So that patch was missing the important hunk that added the

        ti->flags = TRACEFS_EVENT_INODE;
        ti->private = ei;

to create_dir() (to match the removal in eventfs_post_create_dir()).

I had incorrectly put it in the create_file() case, that should just
set ->private to NULL. afaik

So the patch was completely broken. Here's the one that should
actually compile (although still not actually *tested*).

               Linus

--00000000000035679f06101a980c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-eventfsfs-initialize-the-tracefs-inode-properly.patch"
Content-Disposition: attachment; 
	filename="0001-eventfsfs-initialize-the-tracefs-inode-properly.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lrzbg76z0>
X-Attachment-Id: f_lrzbg76z0

RnJvbSA2ZTVkYjEwZWJjOTZlYmU2Yjk3MDdjOTkzOGM0NTBmNTFlOWEzYWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IE1vbiwgMjkgSmFuIDIwMjQgMTE6MDY6MzIgLTA4MDAKU3ViamVjdDog
W1BBVENIXSBldmVudGZzZnM6IGluaXRpYWxpemUgdGhlIHRyYWNlZnMgaW5vZGUgcHJvcGVybHkK
ClRoZSB0cmFjZWZzLXNwZWNpZmljIGZpZWxkcyBpbiB0aGUgaW5vZGUgd2VyZSBub3QgaW5pdGlh
bGl6ZWQgYmVmb3JlIHRoZQppbm9kZSB3YXMgZXhwb3NlZCB0byBvdGhlcnMgdGhyb3VnaCB0aGUg
ZGVudHJ5IHdpdGggJ2RfaW5zdGFudGlhdGUoKScuCgpBbmQgdGhlIC0+ZmxhZ3MgZmlsZSB3YXMg
aW5pdGlhbGl6ZWQgaW5jb3JyZWN0bHkgd2l0aCBhICd8PScsIHdoZW4gdGhlCm9sZCB2YWx1ZSB3
YXMgc3RhbGUuICBJdCBzaG91bGQgaGF2ZSBqdXN0IGJlZW4gYSBzdHJhaWdodCBhc3NpZ25tZW50
LgoKTW92ZSB0aGUgZmllbGQgaW5pdGlhbGl6YXRpb25zIHVwIHRvIGJlZm9yZSB0aGUgZF9pbnN0
YW50aWF0ZSwgYW5kIGZpeAp0aGUgdXNlIG9mIHVuaW5pdGlhbGl6ZWQgZGF0YS4KClNpZ25lZC1v
ZmYtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KLS0t
CiBmcy90cmFjZWZzL2V2ZW50X2lub2RlLmMgfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3Ry
YWNlZnMvZXZlbnRfaW5vZGUuYyBiL2ZzL3RyYWNlZnMvZXZlbnRfaW5vZGUuYwppbmRleCAyZDEy
OGJlZGQ2NTQuLmMwZDk3N2U2YzBmMiAxMDA2NDQKLS0tIGEvZnMvdHJhY2Vmcy9ldmVudF9pbm9k
ZS5jCisrKyBiL2ZzL3RyYWNlZnMvZXZlbnRfaW5vZGUuYwpAQCAtMzI4LDcgKzMyOCw5IEBAIHN0
YXRpYyBzdHJ1Y3QgZGVudHJ5ICpjcmVhdGVfZmlsZShjb25zdCBjaGFyICpuYW1lLCB1bW9kZV90
IG1vZGUsCiAJaW5vZGUtPmlfaW5vID0gRVZFTlRGU19GSUxFX0lOT0RFX0lOTzsKIAogCXRpID0g
Z2V0X3RyYWNlZnMoaW5vZGUpOwotCXRpLT5mbGFncyB8PSBUUkFDRUZTX0VWRU5UX0lOT0RFOwor
CXRpLT5mbGFncyA9IFRSQUNFRlNfRVZFTlRfSU5PREU7CisJdGktPnByaXZhdGUgPSBOVUxMOwkJ
CS8vIERpcmVjdG9yaWVzIGhhdmUgJ2VpJywgZmlsZXMgbm90CisKIAlkX2luc3RhbnRpYXRlKGRl
bnRyeSwgaW5vZGUpOwogCWZzbm90aWZ5X2NyZWF0ZShkZW50cnktPmRfcGFyZW50LT5kX2lub2Rl
LCBkZW50cnkpOwogCXJldHVybiBldmVudGZzX2VuZF9jcmVhdGluZyhkZW50cnkpOwpAQCAtMzY3
LDcgKzM2OSw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGVudHJ5ICpjcmVhdGVfZGlyKHN0cnVjdCBldmVu
dGZzX2lub2RlICplaSwgc3RydWN0IGRlbnRyeSAqcGFyZW50CiAJaW5vZGUtPmlfaW5vID0gZXZl
bnRmc19kaXJfaW5vKGVpKTsKIAogCXRpID0gZ2V0X3RyYWNlZnMoaW5vZGUpOwotCXRpLT5mbGFn
cyB8PSBUUkFDRUZTX0VWRU5UX0lOT0RFOworCXRpLT5mbGFncyA9IFRSQUNFRlNfRVZFTlRfSU5P
REU7CisJdGktPnByaXZhdGUgPSBlaTsKIAogCWluY19ubGluayhpbm9kZSk7CiAJZF9pbnN0YW50
aWF0ZShkZW50cnksIGlub2RlKTsKQEAgLTUxMyw3ICs1MTYsNiBAQCBjcmVhdGVfZmlsZV9kZW50
cnkoc3RydWN0IGV2ZW50ZnNfaW5vZGUgKmVpLCBpbnQgaWR4LAogc3RhdGljIHZvaWQgZXZlbnRm
c19wb3N0X2NyZWF0ZV9kaXIoc3RydWN0IGV2ZW50ZnNfaW5vZGUgKmVpKQogewogCXN0cnVjdCBl
dmVudGZzX2lub2RlICplaV9jaGlsZDsKLQlzdHJ1Y3QgdHJhY2Vmc19pbm9kZSAqdGk7CiAKIAls
b2NrZGVwX2Fzc2VydF9oZWxkKCZldmVudGZzX211dGV4KTsKIApAQCAtNTIzLDkgKzUyNSw2IEBA
IHN0YXRpYyB2b2lkIGV2ZW50ZnNfcG9zdF9jcmVhdGVfZGlyKHN0cnVjdCBldmVudGZzX2lub2Rl
ICplaSkKIAkJCQkgc3JjdV9yZWFkX2xvY2tfaGVsZCgmZXZlbnRmc19zcmN1KSkgewogCQllaV9j
aGlsZC0+ZF9wYXJlbnQgPSBlaS0+ZGVudHJ5OwogCX0KLQotCXRpID0gZ2V0X3RyYWNlZnMoZWkt
PmRlbnRyeS0+ZF9pbm9kZSk7Ci0JdGktPnByaXZhdGUgPSBlaTsKIH0KIAogLyoqCkBAIC05NDMs
NyArOTQyLDcgQEAgc3RydWN0IGV2ZW50ZnNfaW5vZGUgKmV2ZW50ZnNfY3JlYXRlX2V2ZW50c19k
aXIoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IGRlbnRyeQogCUlOSVRfTElTVF9IRUFEKCZlaS0+
bGlzdCk7CiAKIAl0aSA9IGdldF90cmFjZWZzKGlub2RlKTsKLQl0aS0+ZmxhZ3MgfD0gVFJBQ0VG
U19FVkVOVF9JTk9ERSB8IFRSQUNFRlNfRVZFTlRfVE9QX0lOT0RFOworCXRpLT5mbGFncyA9IFRS
QUNFRlNfRVZFTlRfSU5PREUgfCBUUkFDRUZTX0VWRU5UX1RPUF9JTk9ERTsKIAl0aS0+cHJpdmF0
ZSA9IGVpOwogCiAJaW5vZGUtPmlfbW9kZSA9IFNfSUZESVIgfCBTX0lSV1hVIHwgU19JUlVHTyB8
IFNfSVhVR087Ci0tIAoyLjQzLjAuNS5nMzhmYjEzN2JkYgoK
--00000000000035679f06101a980c--
