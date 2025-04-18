Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB7CA5E
	for <oe-lkp@lists.linux.dev>; Fri, 18 Apr 2025 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006784; cv=none; b=Xbr4V4MZMpZFn5N2Q1kVpP/jEzPq62UVb1UqJj+d9S2h4y6uavH9XHvNaxejVZQc+2+SZ4G54vaL77ZIaUc2nrv0CSrolNmyaVTs3ptBlpe3ZBPDMyWWicY95Yy07ai0+D+XrlQX9+GppVHJRpWa81Ix6+WEtBO3DfloufCiILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006784; c=relaxed/simple;
	bh=xaxsr2vh5esxRAXwjcZGMaZVc8eJhh0+f+NdwasP4Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikjS11PrzdSuuQVpw+ma9w3MHsKMzZAHBMzOT9ztee0UAcqeyupmoWqh0i+mYOC7O6tDU9KB+hJ38Nb87ay2msYlgLNQhjM/6WrmEVjd/plWPV3HpnIFbfTtuXNu9pkWTadKFfMl9ddTxpboTEWfwxVII/17XzqR9ZEWab2sLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byH023+G; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byH023+G"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so265577566b.1
        for <oe-lkp@lists.linux.dev>; Fri, 18 Apr 2025 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745006781; x=1745611581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omInQP/B8n4IFkctA4HUk4GOjOuhhoAV6aHSpJdTTc4=;
        b=byH023+GEE7pcmtzNhD8QC4K3OIoOROcPMqONhXDrDEtkfu612qVCCuhXg0aO9nRUd
         bzeQj1bB4Q7Q/R7E5J4cQKEgIz/xXdjZ0Q5BPtaw2GCR8iUFbpNbLN/oIbaifj9ymzvI
         UpmMtvh9MXMt5ea4NZZ0EqMoF5DYgE6ESXAYfFdmNbuZX7Y0+xB30CBS3hyeospciMDN
         nnZB2aB4Djh8IXvITB3X45QS39TWSCWrtirivkAJXScAexdVu/RjZjTnFGDB4ZSBtJ9r
         KXPQwa6+hX7zPP5GYzelSBFR0DJj9hJjhuMxlyR1bJzM/uBoW0RvQGuXtWyXXMqeWojI
         Y74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006781; x=1745611581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omInQP/B8n4IFkctA4HUk4GOjOuhhoAV6aHSpJdTTc4=;
        b=kkp1x/WNtVK/Bg93SwXU4FWZxvDScs25TeRWGgOEwUP0kyruSqV6EUjMP2loqTgjMb
         KfY+0Enl7BD8LEoyqLDucmxJ4u8sG08uTHwCS1UE0EPoSzLFi8v4wXo6Ics1jhy16QNk
         qEIKx0L+3z7+mjJCFzIF9d5gfQ1BDSwwFoUCn9f8uS5nLGdhDTmjddYTA4j4NGLLvriu
         tQ6DTHUi570zvoqQ6s2L5dDdcQrXBr7PzSX47rOP8Q9h7oeb9wDPfW58fY2vwRJWCmrP
         9fSn5MlXPPrhYWWazQfKvt1T1ctwUxmB6dsfQs+IYlHcdIaLc4UlNioITtRcHgHxGzbW
         hs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd63OdCPvieFgVSt9J7E3a6A6PXU/nU/DP4ehkx1JuciAaATK79q/pkr32R64cmfy5CKZpDBI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+igE+aVGPeSuC/36GkjuXVbbLiXXmj6wz5z+Yia8al1RT00im
	hn0yWiOt9CiP5ZE8z5Zsspz+Ba+Zx4YyAKtNtJ6iCAckEhGbht0ellaxLdGuKejm9C3Zzb3k6Vj
	QMa4EQDN7V2ptbcqiyJ/hPjvyF3Q=
X-Gm-Gg: ASbGncuPHXtTQiPZvwlwSWt11G0bYRjBFWR3pevOszHULmz/y+7NIKx+B0Xwx1U7Fw7
	sKs9FWEAc3JriYMZavsPcSYc+OK/fIIqJlPp5Jr3E32fNgCKO0DhsP1qCDxQPJPOcAulXpM9K9p
	l872f3SN1KKocJlr6MHDStMw==
X-Google-Smtp-Source: AGHT+IGBb8F0DoUevMm5LHOWnFczKaaaU01Vu/33ap/sFPHgZcVDPzz2HYcbGg4r9w976i7kWirjXqtSHdSIMp7o+J4=
X-Received: by 2002:a17:906:5d5:b0:acb:8a2c:fcdb with SMTP id
 a640c23a62f3a-acb8a2d110cmr49359366b.38.1745006780620; Fri, 18 Apr 2025
 13:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020> <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
 <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020> <CAGudoHGD0EhEajMCxdQ3f5sjzsSJhZUb6c+rfAjFGx_9S7hqoA@mail.gmail.com>
 <aAHGFnIUoRbv1ppd@xsang-OptiPlex-9020>
In-Reply-To: <aAHGFnIUoRbv1ppd@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 18 Apr 2025 22:06:08 +0200
X-Gm-Features: ATxdqUHb41RTfgydd2M4VNnrBb89awFqGFI1KLCUcXFhNSUWwbmo4iznC7rsUg0
Message-ID: <CAGudoHEPkKy6b7u_0LaYUqHJRtyggacbhTtnA8sNuZpELr-ocg@mail.gmail.com>
Subject: Re: RFB: unrolled inline memset and memcpy
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 5:25=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
> for 76a45d86f78bc (mjguzik/lkp-bench) x86: prevent gcc from emitting rep =
movsq/stosq for inlined ops
> the report spots out several small improvements on different platforms, b=
oth on
> Cooper Lake which does not support FSRM, and Sapphire Rapids/Ice Lake whi=
ch can.
>
> there is also a small regression from lmbench3 test, but in fact:
>       0.13            -4.3%       0.12        lmbench3.syscall.fstat.late=
ncy.us

fstat getting faster lines up with my own measurements

>       0.47            +1.5%       0.48        lmbench3.syscall.open/close=
.latency.us
>

this does not

can you share the kernel config + filesystems used + the file being
passed to open?



--=20
Mateusz Guzik <mjguzik gmail.com>
