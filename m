Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D543469FD
	for <oe-lkp@lists.linux.dev>; Tue, 27 Jan 2026 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512813; cv=pass; b=Ciml/bfSjE/0R61oVlMT8qXODXWOzi0OBY+spz3AL5WDgMaAgPy0aKQfqAnotSpP3VYiOjJ3iMu2/IDIOsk7JU09Ka7yzuG1yUQ8qAQsKR5jMoIzZMA2tlg7riUlfmNswx/prQECEh6qX7F2B4MHKiSl2kmzGoY9cT+jf8wIVHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512813; c=relaxed/simple;
	bh=crKfGbjqP0vQ/lB323LrfgWwK/MTeB+j4XPxswidJlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fq59qIgYNx0abcsl/8db0U1oG4pDGCSuA2AhODwsrkCMd03tmp0o30SN7wap1kqsQ1URnptv+GUeV5D6BnkpVScHQ0JpXhZJqXN9Mh/cHeVvryfpehkqxSsJiiTwKy78Uhwh0zAGXkeUBUYo2O6bR/NetZbSc7jJj1h5fqfnJr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zo8Ir6lt; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zo8Ir6lt"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12460a7caa2so7923570c88.1
        for <oe-lkp@lists.linux.dev>; Tue, 27 Jan 2026 03:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769512811; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQyhJJu6xvhAHXFcJEVikdnbyzY8n0d/DXj0n2CeJt274OqgUbhjJfCeHwIH7jlSIg
         Tdv4zA5uVtm8b6jtekit7mHCsx9ibuy43B2hoaZWCJU+CO81PFay+JTC3VPlcblr3Kn1
         gfWfF8eZgp1r4m4dorSyL1R0d0GND7+OPHsw5zNzwtQeAQ15CZn8B/crSRz+PNnScbE5
         V6FtZvk+AhpEvsWAfERlQKMaDZ/h+nHBAIkz3zgkK+OkmcQ9JYpp3Fhce6QW5fJhXCsX
         wx/moSL1KFupNfPq//nmV7vQAWSJHeILSZ0QvtMVg+s+/ZfiKN7rS/RCBve/cyJ3ON9i
         gZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V8ID9chnybMElnOgkdtWrOybJmoUuP4G5J0BRDiINok=;
        fh=B2Zf+uluKloQvFns9+oM6V36VlBufCPCQF2X1MSWPHc=;
        b=Otsnj3Gy5X5S3P/6GguI+H9HQxiRxcoVIFXVZEdqBns5RbzCqTWuPLJWLJbaw8sAqf
         uD0vaSaKP6GzBMhDILRP5ykILICw9+72uOmhS6xksfKAtW7SiMVTjcBaZZXjT8f8X9Be
         gQNPl0CvtrQ9kSpukLhbjEvQt7FL63cvdjwXQbRWQBmL4o96PybjxUCTq64sWC5RaUV4
         mOO3XySXkEFVFcYpoJXO6bQmzKTUomR1NeOqjJUtJuL/cLqIHyI4mcX1tOV8hv3f/+/I
         SzNvyJCQ/kvrOCxZQb9UVj0zcpaLgDkVPgMcjy/rV73+IpGm2JB5ZNWcyZ1InUIatQFa
         toMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769512811; x=1770117611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8ID9chnybMElnOgkdtWrOybJmoUuP4G5J0BRDiINok=;
        b=zo8Ir6lt100943/wSnlZujTcPae8SsLuSLfwoJ/Is/f1XG3EmegTbh6ztanUAbq6Zr
         CQFpTa0Q1dwgyNyPAtOT9d3o79eVIuxtp43e1T6CzJrC2rsjHhOaHOoCakJenZtypV94
         HbeE7E1aGkl9TEW11FTiAdPLIo9ehjJhck/RBNaqRit5Bqvp6q3DbAtMeDmg/Av2eoG9
         04NchgC7Hm7kX18m00sJNaeGHDI8rGGAQdhgOLfejyJI6OTKk6N0kuWn3yVnqzCc6lh9
         Mrrt2rW9eZIzuZf55Kwk4ZPJ0aO7dJG8etTDbA2NhUttdeAXtoN1p2Ic8UwrMBV5BD/8
         jkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512811; x=1770117611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8ID9chnybMElnOgkdtWrOybJmoUuP4G5J0BRDiINok=;
        b=Gdlo5fbO0Kk/xh54qZLIPNbewdDsAaA6tiaTUGFB1mSrzP/S2cMFruKdd1VyDVl86f
         Y8MpB32NcYh0XhY+sljISC79rRjAwU3FMhqJ1Z3/iF9KaX76aFWSv3golB0Y+I4GL39w
         fEngRirNfBsskt+18gqsy3c8J9hbHWgDLEaeNJhjBcx1QQjz8k3yVtbQgenYwiFgpbCG
         lMIu1h1rUv70PMrUWuETcV1nci+eJo7ZtAmRHUpK/RKxgDFaWc+8B/dK7kg0hws/9r1o
         a3WgFvTC53YzDJ2DtQ/ZacZWzvUvVl63kNatZD3NSNdTnomopGCDhDwODfnWIoBwPCxM
         rbfg==
X-Gm-Message-State: AOJu0YzZIFSdknEh+S+MmZecicYZ+6Gqq1wWDqP5yX1NgN1riyjPH4Ga
	1ZM6+K/r7E9TRkum1BWA6oGI5dSCodHR343ixrSbuG+7tZBd16Y7ltA0RLV+x8EtmiGkU4isSlE
	3Ps96jAmvYrAwkb5xHHCo4WMlwW7iPBgO1RD4JhCF
X-Gm-Gg: AZuq6aImeQKkmn9DnmIeIXAXf43CAVPCdyo1ZXOCB/dfPzq7tsKbPKYni3tOG8R6LBf
	ZtbzLdI3QHYiSCxUxelhq0KV2v+UE7D1ScC+6mAxC1nTwvMMBELWTMJmluYS/UzWJKQLzEjSsG5
	3qdNCm1+GPx38NY73M8r0vCkeVGv4+ZV7dBENx3ddxLJOZVbiITOFfYl24GfjK1krG6Wgmg5fEj
	NkHU/s4SR28sW9t7bRoCbEz9L1azyA56bcZTmiNR4RnvkF9ZfreF/ZYjgOLWUjCmmz+UD2jXxgm
	laULx5MAN5II+cRBE+5SQ+UuHg==
X-Received: by 2002:a05:7022:6b96:b0:11f:2c9e:87f8 with SMTP id
 a92af1059eb24-124a00ceb44mr846041c88.34.1769512810986; Tue, 27 Jan 2026
 03:20:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601261546.d7ae2447-lkp@intel.com> <CANpmjNMEyvL3SKMF3Za7vgQ=zYujDmJiR_s0KUcyC-3EHMdhsw@mail.gmail.com>
In-Reply-To: <CANpmjNMEyvL3SKMF3Za7vgQ=zYujDmJiR_s0KUcyC-3EHMdhsw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 12:19:34 +0100
X-Gm-Features: AZwV_Qg4r9Xt-BuPJ65Eo_cjtMH75s-rsaXhOdiDf-wuKcj3wylsfe9VFHgILk8
Message-ID: <CANpmjNOJ4f+x4y5na-oK7dtQazz3AoeSZPrmaLUMXx4=BGAQ-w@mail.gmail.com>
Subject: Re: [tip:locking/core] [cleanup] 3931d4b980: ktools.maple.make.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jan 2026 at 12:54, Marco Elver <elver@google.com> wrote:
>
> On Mon, 26 Jan 2026 at 08:37, kernel test robot <oliver.sang@intel.com> w=
rote:
> > Hello,
> >
> > kernel test robot noticed "ktools.maple.make.fail" on:
> >
> > commit: 3931d4b980398012b66c8ff203bfa2ab3df71a71 ("cleanup: Basic compa=
tibility with context analysis")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core
> >
> > in testcase: ktools
> > version:
> > with following parameters:
> >
> >         test: radix-tree/maple
> >
> > config: x86_64-rhel-9.4-func
> > compiler: gcc-14
> > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.=
00GHz (Skylake) with 32G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202601261546.d7ae2447-lkp@inte=
l.com
> >
> > KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rh=
el-9.4-func-3931d4b980398012b66c8ff203bfa2ab3df71a71
> >
> > Generating generated/map-shift.h
> > Generating generated/bit-length.h
> > cp ../shared/autoconf.h generated/autoconf.h
> > cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../=
lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefined=
    -c -o main.o main.c
> > cc -c -I../shared -I. -I../../include -I../../arch/x86/include -I../../=
../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefi=
ned  ../shared/xarray-shared.c -o xarray-shared.o
> > sed -e 's/^static //' -e 's/__always_inline //' -e 's/inline //' < ../.=
./../lib/radix-tree.c > radix-tree.c
> > cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../=
lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefined=
    -c -o radix-tree.o radix-tree.c
> > In file included from ../shared/linux/cleanup.h:2,
> >                  from ../shared/linux/../../../../include/linux/idr.h:1=
8,
> >                  from ../shared/linux/idr.h:5,
> >                  from radix-tree.c:18:
> > ../shared/linux/../../../../include/linux/idr.h: In function =E2=80=98c=
lass_idr_alloc_destructor=E2=80=99:
> > ../shared/linux/../../../../include/linux/cleanup.h:283:9: error: expec=
ted declaration specifiers before =E2=80=98__no_context_analysis=E2=80=99
> >   283 |         __no_context_analysis                                  =
         \
> >       |         ^~~~~~~~~~~~~~~~~~~~~
>
> Sigh, apparently user space code in tools/ now liberally uses headers
> from include/linux/ directly. E.g. see previous fixup be8254f69446
> ("radix-tree: add missing cleanup.h"). I guess we have to somehow
> import some of these definitions into tools/testing/shared/linux until
> it works.

Fix: https://lore.kernel.org/all/20260127111428.3747328-1-elver@google.com/
