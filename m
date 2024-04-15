Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6173199
	for <oe-lkp@lists.linux.dev>; Mon, 15 Apr 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191031; cv=none; b=fPV8uoCXXAuomF36wDOj9sbBILFlORkpDnUMkUn9gPzeNKMx6eEotYjLJkYuaVbCcUwfvAKRgNcHeAjyeRTNEsK6v27Zp3LQt8Al75/aH8stZe3FzMTml3N3IdMXfLLY7rnX5h9WRo49hjxRRPu5/fKCaRlDvtc+uuc47nfmXc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191031; c=relaxed/simple;
	bh=DjPumZsJVqQfEW+5UWh6pJFZsGr6TITJM6/HJu6WuT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE3ZvRf98J95nOXgFShSM3mGSmweBZ4X2FZk/0XiNnV0Hl+tKWAFzfBcNK7V/jh3AcrzbmnI77ySjH23841k8XNzA9hSgf2gDxKfqAI5Qhri5F48A/nK26i8UpCtt85E9ypPTILQWqhytxX+5TgIE8DkgdL91PBVCdEG11bRMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FzYbjF4x; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FzYbjF4x"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6164d7a02d2so37057887b3.3
        for <oe-lkp@lists.linux.dev>; Mon, 15 Apr 2024 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1713191029; x=1713795829; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y9VbcLLmnz0/DZyVAYjkm3SQI/d2qqNn15GQkXprXI=;
        b=FzYbjF4xTBtKBgTaL6N3hv5srxsCMB7Ot3X94SA7bdtxCdlebUsMYdhGct54jVkuTC
         C9npZKSqwi6/lnUhEa88C8mKeIpNSCpRNVZaj46BnU8QWLI3Agonxr9+6pusL3USxGBe
         ncozAcSqWRKRVIHPlcvvXkWvGi2G2gK6luXc/smgOuTuKOBMKWfKEsUE/ib3bK0LFjeD
         4vNbMiVm3PWdYhZVr6uorkNqmvCqcOWh+LyXuWGfXdxi1Lsj+ZTM0R53x3rfRbxBcEfX
         OzyEstad5t7d4oyby2SEgbkjwN1swnyrZCN4gNhzvMXCKN9ARtEjqn1EUBSxhrRUwCaA
         xYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713191029; x=1713795829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y9VbcLLmnz0/DZyVAYjkm3SQI/d2qqNn15GQkXprXI=;
        b=L97TyAbE6+MoELOuDv26yIrDBvs9p3/rJnpBeN0IfJcZdgoLEkhqUlyyq1hGJFm4pc
         o+kxrFsdPouFcPMEuhvMH1t8P7/ZIs2fwFDrf1Vl2owvZ0fOT8TGMMrEanqwpgglt8JH
         oRSCa2DpJzb2bdXnXG6SXB7Sssi0OGDs1aD5XKass2e1AsbhA4qoH79Ki7y2ynPucWky
         OAfLGy+YqrZD5Jw9HT5SPqc7uP2nP4KgEAaU+3qH36//fYTc/jzeWdwHOQc42Eae0pV8
         ovEl+8ntgllIge/mmP6mB25MeDtlXObu0yjKuR/5kYum0IYJAQj3pQtb3nizrlSogoJ7
         s85g==
X-Forwarded-Encrypted: i=1; AJvYcCXXSlYeM/0Bb+hudGNnOB+9595qPjbiJ/MvGxOP6AHa/Qpt+D9ad9St/wJfriP50M29/kdDGdbcyFWTXjpx/QU9tyP8HRfP
X-Gm-Message-State: AOJu0YxqV9wJ7mQk+F6WQWW9LIBHzpq7zmEJlIvtWhwaTw60RNhYnxI1
	+sdq54VzpGQGAFmsEQ/N980M0ZoD4NEUMBJU4p6it9Tg+L8dkiWV50iPYprtfByOIr1XH8LSkq1
	BIghU21+qbX5nwlcBg0ZyOMLFuzSoJSKHY2Td
X-Google-Smtp-Source: AGHT+IG5YBGt31zPh1RxDxOyUC/oOmAliyWal5DihWErYrtjx3gqFZi1R7MMZV9pnaXYiGSBEJ7vqkkuCBVCnULk0Vs=
X-Received: by 2002:a0d:dd91:0:b0:614:6b2d:c6f8 with SMTP id
 g139-20020a0ddd91000000b006146b2dc6f8mr8940716ywe.46.1713191029296; Mon, 15
 Apr 2024 07:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404151225.ce542e38-lkp@intel.com> <757538DA-07A4-4332-BAFA-B864BFD06A76@kernel.org>
 <30876b80-c437-4916-b982-97c1a95c0747@I-love.SAKURA.ne.jp>
In-Reply-To: <30876b80-c437-4916-b982-97c1a95c0747@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Apr 2024 10:23:38 -0400
Message-ID: <CAHC9VhS=hQuvv+Sw6cc2HwzcLApO7Rc3dAnqHytyzBpC1rokFA@mail.gmail.com>
Subject: Re: [kpsingh:static_calls] [security] 9e15595ed0: Kernel_panic-not_syncing:lsm_static_call_init-Ran_out_of_static_slots
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: KP Singh <kpsingh@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Casey Schaufler <casey@schaufler-ca.com>, Kees Cook <keescook@chromium.org>, 
	Song Liu <song@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 9:21=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2024/04/15 17:26, KP Singh wrote:
> > This seems like an odd config which does not enable STATIC_CALL, I am g=
oing to
> > make CONFIG_SECURITY depend on CONFIG_STATIC_CALL and make the dependen=
cy explicit.
>
> If CONFIG_SECURITY depends on CONFIG_STATIC_CALL, architectures which do =
not
> support CONFIG_STATIC_CALL can no longer use LSM ? That sounds a bad depe=
ndency.

Agreed.  If the arch doesn't support static calls we need a fallback
solution for the LSM that is no worse than what we have now, and
preferably would still solve the issue of the BPF hooks active even
where this is no BPF program attached.

--=20
paul-moore.com
