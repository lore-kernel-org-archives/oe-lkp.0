Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6EE33372B
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428504; cv=pass; b=J3HIxe39w73S2RYXYQpg8x5AQXfW7qWvc24u7z986kSG9HKNctOY8CRNaRPN9hnmwdxNMQEG6FQdPNObV8FHFSJzAM4O2L1R1VjLvGCrN5KCKBHdHcnLefmm8TFyKcN/pRxwSdVK5471gs+VgNxrvbVU4yowrRSWNaBrHmeU2lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428504; c=relaxed/simple;
	bh=d7RoRzOIObjdYbYB9F89l7ZqvXckk+hmsP/COxE/GdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJ6oJj+gHRMr26pxjfhPMghFyMEPleZMGblD99fjKcb/pKb9bxme96bXpC5aKl36rNK7Ov8CyEa/OZBwee42wLwQ2Q5NTexjamTMqjM32pzCFGGrcNfuJf9KBXtcOj0+rJfIrWIGHwKSL+MIr5+jfQiGVOIyWheJxXpkkXNL5eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+0976OQ; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+0976OQ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233b953bebso11074810c88.1
        for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 03:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428501; cv=none;
        d=google.com; s=arc-20240605;
        b=BRbpju8B2ec0bkvxWkpc44Vamw0xeRly++TQdhvx3LAZ25S2REUXIRF0uPMLzwjWCf
         J+tdxkjJPpUMyFJG3RFtq5SAgp73/uwjvONJ1+1TPFhpCIaUEH/Wfx1HdD9XbQE/l7VL
         YRLRR32uotYNRk4ABft49wqLPNKO+ruJ66WKJ/L4aPmBpePwyvsqWGTOTAI1ZQXDFHdq
         vCLtce3sj6AmTWONs51VL1y2cOrBXUI0gme0NPdGxCuIxzUd42MtsAx5iz3/5ZewMJ3b
         2wIpnR26z92nWGbZU2+MvT1/UbIyRyOYavuFlQSDYMR6VvsiKRxgEGvwmrZPl1Hl7dDy
         tc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4dduh2wY4nu99teygsDC1CTChSbmFDnnc2AJ0OAQ+NI=;
        fh=B2Zf+uluKloQvFns9+oM6V36VlBufCPCQF2X1MSWPHc=;
        b=drjOmiCjn49s2EcxLOFwZjqsbHLZDit4nTeK4RdqlehpY2EzoGe+x04Q9JSUQ2EfZq
         0Zq/wBay3ugfE+BOlmO4zHl9DTOk+eXuGr/evI62TdZwn/X4ZOflPS7y8wjFr6uuGOfz
         4tCYiFA0srCVzrM+nwaRz0G06A3sBzqmGIQffySZ5GUijCxm95rJuKjkbcEUT6713amh
         BWQmVxS6mRj532/Dmik6UVA/JjrTm1NYXiCDoofIUSZRwB3OJLG68/NBxQpzFKXEObTu
         OiYl2sNn1M1o+kXHIf1SJ2AEr/B0NtpVzSJC2H/HvsmSTCuYFO0kLsltobtN9+94qQHj
         BZGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769428501; x=1770033301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dduh2wY4nu99teygsDC1CTChSbmFDnnc2AJ0OAQ+NI=;
        b=o+0976OQ8b2bBs8ITIb6bFsl56JZHft0xfQ9p90G/yyP6pnvL1GWmxfkfDm7xkzaWO
         Fk1RpBsdhJLIU2hnmthEeIV86UBKhb9q2HyGgmzCPmt9zhNlM3hcYDXq8pNI9HUi5Dfc
         KtN62BFoIh+c3wleIP5fKDqadAtHrKrqFd27tlsjCqJqjOF5fzqlkYlOJyXU651KCWj6
         XkdhNe7HRa2hHtdK2glO8Ak1EhZgR+JpbiRS5I4pWE7Vy9PEMEMhY6upl1fJ1a2t726X
         QuEDoiVqt7Ff/5RwAg+LVr5hTlMFfLE5m5Ndh4LieSmuQI/tikpumx9ULeLKqE0QV2Aq
         HulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428501; x=1770033301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dduh2wY4nu99teygsDC1CTChSbmFDnnc2AJ0OAQ+NI=;
        b=ApoAoAAhY5ibA/VFYMCYt46RsfBxCg2nL5UFjQkWKM7NED8gcPsFgL5z8GKAaXqJhW
         czn2PI6xe62JBJkzhdjOwqro/YZcRLXQ8mg5J+UnBiTGPs5FHA2ANH+yraq1I8BZnhAU
         QGwiUM8AGBiMBBNjkG2mxpcmleSzXAyQbTbm5PL7jR1cteNcvOJ1aTJ//8I9Sfyx59mK
         M1dpIroIAGxXViMBaOr+4SOLgBMolPLIdVC2NJ/GP9F4HzO4ijDhvrX/xPAm7bAHSPK5
         OzwihqJFcqtdJip93KLb9bXfCfJaL+SEx04OrGu3wcSDPohHqABxknuJjwQA8QRsMOSt
         Ddfw==
X-Gm-Message-State: AOJu0YwTq5YYPXod5tNq6m81ZTGejCORgmzw2BxTmXOxk4X9YepKqPft
	y25p2NS3QAqoxwyAEth6Rro+nVVwLtridSrVNF9yCScSmaETHUaKCpfAEsGVFQ+A9wwJI3Du6X3
	dUdefUbydo/IbbTmQPKwr0pD0xaSWnll4JRoIGDK4
X-Gm-Gg: AZuq6aJZlTAGBxcJ8SnALc/KtsqRD10mXEF9+B69rYLHhR/nmK10w/Gb32TBpbt+keJ
	q5/4FEa181Gcb4fTSTgQfgQmTmaxqsBM7RZRFdvx/nZZcz0hu0yzdCqWKxdzWzIgALOI40yFQxJ
	jqekHx2yhbwfzdctSrb7PFQRpUsWMww9Od+v6yko6BDFupt5bW9Z47j9+MjpUYc2JvsoWemKn8n
	unTj+uEXj1i+8FyNg17NRE3j/4yvtUunFvcyz3KP+9gaCF1h9eNN55kr8Kna7gVBpsQjXgjnUTj
	wbQfjljmDD2zl+7IK/lJLnnqtCbzI89LQzTX9A==
X-Received: by 2002:a05:7022:68b:b0:122:153:d161 with SMTP id
 a92af1059eb24-1248ec2861cmr2353060c88.17.1769428500923; Mon, 26 Jan 2026
 03:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601261546.d7ae2447-lkp@intel.com>
In-Reply-To: <202601261546.d7ae2447-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Mon, 26 Jan 2026 12:54:24 +0100
X-Gm-Features: AZwV_QiWPHQTAttTRahfrnLOUfLW5QLftUaypFe3BeiGqDPMBItRFdIfp8TaQQo
Message-ID: <CANpmjNMEyvL3SKMF3Za7vgQ=zYujDmJiR_s0KUcyC-3EHMdhsw@mail.gmail.com>
Subject: Re: [tip:locking/core] [cleanup] 3931d4b980: ktools.maple.make.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jan 2026 at 08:37, kernel test robot <oliver.sang@intel.com> wro=
te:
> Hello,
>
> kernel test robot noticed "ktools.maple.make.fail" on:
>
> commit: 3931d4b980398012b66c8ff203bfa2ab3df71a71 ("cleanup: Basic compati=
bility with context analysis")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core
>
> in testcase: ktools
> version:
> with following parameters:
>
>         test: radix-tree/maple
>
> config: x86_64-rhel-9.4-func
> compiler: gcc-14
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00=
GHz (Skylake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202601261546.d7ae2447-lkp@intel.=
com
>
> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-9.4-func-3931d4b980398012b66c8ff203bfa2ab3df71a71
>
> Generating generated/map-shift.h
> Generating generated/bit-length.h
> cp ../shared/autoconf.h generated/autoconf.h
> cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../li=
b -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefined  =
  -c -o main.o main.c
> cc -c -I../shared -I. -I../../include -I../../arch/x86/include -I../../..=
/lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefine=
d  ../shared/xarray-shared.c -o xarray-shared.o
> sed -e 's/^static //' -e 's/__always_inline //' -e 's/inline //' < ../../=
../lib/radix-tree.c > radix-tree.c
> cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../li=
b -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefined  =
  -c -o radix-tree.o radix-tree.c
> In file included from ../shared/linux/cleanup.h:2,
>                  from ../shared/linux/../../../../include/linux/idr.h:18,
>                  from ../shared/linux/idr.h:5,
>                  from radix-tree.c:18:
> ../shared/linux/../../../../include/linux/idr.h: In function =E2=80=98cla=
ss_idr_alloc_destructor=E2=80=99:
> ../shared/linux/../../../../include/linux/cleanup.h:283:9: error: expecte=
d declaration specifiers before =E2=80=98__no_context_analysis=E2=80=99
>   283 |         __no_context_analysis                                    =
       \
>       |         ^~~~~~~~~~~~~~~~~~~~~

Sigh, apparently user space code in tools/ now liberally uses headers
from include/linux/ directly. E.g. see previous fixup be8254f69446
("radix-tree: add missing cleanup.h"). I guess we have to somehow
import some of these definitions into tools/testing/shared/linux until
it works.
