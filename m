Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5EA399019
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jun 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588799; cv=pass; b=QxjT0iZDAp8OGOP5+HoYbAyECKJY2a8ICAzex80KKqN0NmBd0L689XtDn3AfeR/q7/5qmXhLqI6YTz9Vxcq+wpPR/tX8CR2R5r0s8h52Ga9sPlrv2Thl73au+l4EKA6/MgMEDiycHPgU0RWM0it+Nd6wTNlT9xJyDbIYR+gNfvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588799; c=relaxed/simple;
	bh=FJ3bMDTJ7wDz7xOslVuARw13mxj+aIXTiGH346mAsqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qziN2ODd/ffTHo8GoYUCttbj1wUgaX+Hb3wzfJYOhBRUreWmX6xrxUg8nmAzkcpKzvMDZLa00kaulksiIr7rD5zlTDbZ6lMzh36rs/Fy00QFVS4TIBy4JEncg4I/Ut95ke4O8IWvuw7PZNOWfMvaD+gjg0YrmTHU+xGMMKFBNo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRZSxNMw; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRZSxNMw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so10146a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 04 Jun 2026 08:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780588797; cv=none;
        d=google.com; s=arc-20240605;
        b=Ud/xkrmUgdtANclfATzckeo55E6gA5y4DvFK29ptwri+42Lfv6+zzV0W0+bIXlQoov
         0rPcvXJzAx6nTbPGjsaCvyKOau+0iK98JiK3TpfOJAL3UZr6D9d+PJy6ynTk/U8isMyd
         TKfvQymcvlK5cXQAQ1rXSgmweC2d++y16Yzn2W/tih2beX8qxXo9hPP4GcqZR7I/vo1L
         K6Mf/idazQYsUmEyOLwM+VCPirjzV5mRPr4kk5mipoqD+UXSXBYI/2EoZBml8cy5FYSt
         KtktwaNlHmzjA5TOEirjLRjgxJwZePLkKDN3af4WiMJ3yzV2MObH/BFYKvHona0+Klg/
         7ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJ3bMDTJ7wDz7xOslVuARw13mxj+aIXTiGH346mAsqU=;
        fh=kpw3wlUMgIi1W0oTUc6JBPI09zS3GgaZg9pxm4wYZm0=;
        b=LAVWotGw2TBfr0LdwW/GLEziC9MfJUhRhrb4FuxXneGxJgZtxZtCIkw3rqtKjAsy52
         ZTSXfmxOliC9S2rcFXwQO7ppMJf1omHQzqYaz5bhK4meQ0y2h8qrb9rjgAacjVUV9lnM
         TOSbhSFuVjko53RUTUVUQxeoewlC326ccVk3XoJXSJu9AZCtwqvZHmImmtsMYxC3yCTP
         B0IEJ2d+vrkOjd2gFtxEazeC4yUsZcbPt1qxlojWDTvPIYIpBtaI4uDR6ogPyJcbbjB/
         swABvZLeEkuJJH5NpJFA6Prna1jXRqn6hpiImjLmLu0AQ4VPTIYW9UDY7c9RTwaqo1eX
         jang==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780588797; x=1781193597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ3bMDTJ7wDz7xOslVuARw13mxj+aIXTiGH346mAsqU=;
        b=dRZSxNMw14cpYSeGeGpLykkVvHlTuqwK6yn4ywTKZ2bq1AD7+VbG4XgIKZDevhzhUm
         10XbBN4KKAUz5jjLdf9brNdyxlM0zjOWsuXC06F1EhGGVWb83kTT5vS2XxvhcapaeWYJ
         lCDtOCEknJHphzI2a9moLvbzfqePQ91G8Uo6lfXx0ARi/xhnAymY0m3y5+bykS3SejDj
         yjQIOP+b/n2PLV1+hLeC+VER4t/ph8PQiIAXB5OjWw7fJ3LURzrztTylxVIDjIFxBXbK
         He4DVr9RDtdzqXlAwL3yRsn+hLPBjaaFkC97GuiqOQ1zZdC5IOxdOSw5Wd0fufgqTQ09
         09ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588797; x=1781193597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJ3bMDTJ7wDz7xOslVuARw13mxj+aIXTiGH346mAsqU=;
        b=DuZf1i59OqJx92Yh3EKxg9+HSQbVOFjud8C3+/YDlLCbBP0i65AoEz3mxruBBJatJR
         kQMq4+vMTxlPJANZBBSgJOH74hMfowb9PLVhwweTAvPJ7gCGEchsNgDzBO1SSDJEDasY
         M/TCD6mGJNlK5Iu4xcQ2J8c1nLLeYfLYxkOvyOLWrPOtP98aZJ/T+FkPyod0jf8ITmTJ
         L+/tF1D8QhGuEBMI11zEbhHrTgzDsi+zy/TOKSDYmbGCfsjVUXnu9LwvUc4ld78yTnyj
         I/EkZnaNaAvEVtYmfO53G22EolyOWX2mbZ79cPybpr5Nu3w11NkZNvEbuqn8Va+mF/9D
         O12g==
X-Forwarded-Encrypted: i=1; AFNElJ+5R31iumlUIhPRTraBCoNLMBg3rNPeDXXQB59MuWJBoGJrKNM/iVpgRLtZOvMfM8Y9yoy/vFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzMdl31yo+7rx1cY9nrMBlcNmTelHwO11TJHBYxDHt5jDnIArk
	zwHOzbk1CQVQ/Vu5maiMKJVXLws8K+pY4k2G3zWYwz606zGeEyoNZ3MUAU8I+0GnGZFccPDDrJZ
	Kxka1llYeRUj8wYHWCavsMNAg6+N1iK2pT/6i7KKA
X-Gm-Gg: Acq92OERYKuhCNLztfR2hzArg6+TIXFrEHww33s/E9Zuwia2npCHHdjSiCO7BKuLTgJ
	0oD0sAHUJxMS0W0LExuCHNogorcuuPPLtY+988BvQ/z5JyoRbqBfROl016M5qb922h+pYNtAVBh
	lJIlJWG4LuMmVs0P+zRZwrdhvYx1SboI9OF/Y+APWkMPzqUbWlIrNMrbGhORNbX+gqTWEf4NHsL
	9BrkIPH5XH5xBXF3uy3v+Pvl25YEILpdJN2vLIYi4k24Exz8iWZ/7Bey9nEvV8tesJa2+rCn2Y0
	fWstDUYBpUXqCdrExBDCxHItLaD/FiP3196M/HoeYKEAvt9I
X-Received: by 2002:a05:6402:74f:b0:683:33ae:8689 with SMTP id
 4fb4d7f45d1cf-68f12086f5cmr120282a12.4.1780588796652; Thu, 04 Jun 2026
 08:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606021924.b6d8a0c2-lkp@intel.com>
In-Reply-To: <202606021924.b6d8a0c2-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 4 Jun 2026 17:59:20 +0200
X-Gm-Features: AVHnY4Ly3IWpSKTC07eK2NlgdYhh8pgyTffbvDxmL0tAeivU_kSxzjH_j7NQfA4
Message-ID: <CAG48ez1t1g9Sr-SFQGZWjCjz3gEEhRQhPQ6s=0hZZ7ebBPMG+A@mail.gmail.com>
Subject: Re: [brauner-github:vfs-7.2.procfs] [proc] 0ec6945730: kernel-selftests.proc.read.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: Christian Brauner <brauner@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Christian Brauner <christianvanbrauner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 8:57=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
> kernel test robot noticed "kernel-selftests.proc.read.fail" on:
>
> commit: 0ec6945730e17fb8a44283114493b1a54caabf09 ("proc: protect ptrace_m=
ay_access() with exec_update_lock (part 1)")

Thanks, I have sent
https://lore.kernel.org/r/20260604155806.1402880-1-jannh@google.com to
fix this.
