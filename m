Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA220ADC9
	for <oe-lkp@lists.linux.dev>; Fri, 10 Jan 2025 19:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536504; cv=none; b=Aqh1/nm0UgmL+a9ELt832Nv5HLY+bSIbwUxrWreIop5vDCv/ND5DQGuXLGFwTk8SgBMS8fz86pLbjVMm92+vKTv12yKFdyxJ1otelTgTsowWaxvuaJAO1rnXnX1bqyGL2FSi+7WgmSqq/ShEt0Xj0t2mnQnxf+zHiXZ2CY6uWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536504; c=relaxed/simple;
	bh=zClZJBAhEw254+L+vqgXeZhB4ull2qPmPWhvpuQkIwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpQiV+pofQ7mQStsCC9eIcLonJ2EbHx/XzZ75dRpWJs3YSAkrf+vgvzzDpdqk5ESGs9a8Lw4cem1ML4RLXf0q7I4VAmaSc1HuNfecSeRwmkAaNptb5HS0BXq5OLCmsVVh/cW6h+ShKZZ7oz2DLvot9jD/CgZjqdipVRIExwfUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsC5CmKa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsC5CmKa"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so3823207a12.1
        for <oe-lkp@lists.linux.dev>; Fri, 10 Jan 2025 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736536501; x=1737141301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zClZJBAhEw254+L+vqgXeZhB4ull2qPmPWhvpuQkIwI=;
        b=XsC5CmKanYvfF8uqyiNINk4sntmEfs6aiVA6W7O8hipVVP6sJqlockm8E6WuDGurbx
         nPLCmMDi8vQWlXz85aBQl6IH55PMJ/zowsLhgej1BiDuKsa7cA05q2AtZkG25uzo0ZQJ
         6ZMM05b5EUUjJEgEvBtaIYeQOENmQ/Z1RdMmK/0TZ+rWUGrBW9JBwnbV9WepnRkPg830
         m31iEMH307LBPYFXMjfwnyO2EuOQTpMYOb8E3VzpwGW33O76c6/Zs7YsAUNR4DpQTjmK
         bIiJsi9ppcvQy+BQcaJSw3ho+G7ZLaV4IJ2zU5N4qqUtJ5JPKm2L8bzX3W1iQLcDsyXw
         7ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536501; x=1737141301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zClZJBAhEw254+L+vqgXeZhB4ull2qPmPWhvpuQkIwI=;
        b=tXT/p13lTwSiIS+y9yY4pwyn6vsXhpjqe1mHnvd9Tf7X9b/JKQ9KmEuncpM3RYixBe
         RKC64GulYOBfvMseG/I8bgAOorJ2qiI8viznwyiO1fpytsRjPZ6sveErrkukTyqr2Cbm
         dAN1f+ffY79gjWLWlRBOQ3cFHsX1HVoeUV6vZeHzIn7bBXF8QgIKOwA84Dl4utYGqwRq
         kHlNzBQt472BRTTlAJtU6Tzs3LB6ZBrqvIXNNz6lxaOIyfejFG/mQwUlh2bVl7dKECzz
         Yzr2em5qnmAfHWICkDmSZUpkLNpVCnbUJoBjEd7ZIfW/nAz4Zh0KaMcmQ735wTeZdzLV
         VeZw==
X-Forwarded-Encrypted: i=1; AJvYcCV1LOuayMYrtvRzn+mLZ9DfSGuhZ5ZmId6BEO9iV/HuSCOBvRucnwZx17b0l3MhutBYXp8cJxM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2K5OcyC1LtCyaDU+rtsXGHDUa1ksMOnAfllqasb6znlGE+Rhn
	YwgF7BXonOlJiLlXFhzAMnZZ9CJFa+id47dXs7bbMjSZMakN83V9QJdz1yIbztlCO0tqJB18s0t
	nl2cJNWpC97P4fTNkpCzGCLKvTC0VjqB5
X-Gm-Gg: ASbGncuFUjxtcz7llfCgstY18f+2l5Whn1/i2CzsHpKwHEaH3DZvFy66x2V6AnfgWdk
	/Cx2pyEspuTQ3MpDczrKjfvqIWihm/qTV4QUO
X-Google-Smtp-Source: AGHT+IGZzz6OkaZA/AYyGYsZofAg53/Iz1c31dr3qcwEcyyLsvRxJWn7U2djDvV8m2KuLGI6XdEvYwWd7yiTxH+89ik=
X-Received: by 2002:a05:6402:4025:b0:5d4:3761:d196 with SMTP id
 4fb4d7f45d1cf-5d972e06cc7mr11009109a12.10.1736536501147; Fri, 10 Jan 2025
 11:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501091405.a1fcb1ed-lkp@intel.com> <202501090850.F23EBEBC5B@keescook>
 <202501091236.E3EDA2188@keescook> <pep7tppcmd77ejaa47bhajc3uoy2q2n3cladgc4btdri4mth65@dqjulq2hx4l2>
 <202501091256.4F3B2E8@keescook> <CAGudoHHymwdk9ChLK=JcPtRD8BSTRDG9B78yOzcRoBGWFzumng@mail.gmail.com>
 <202501100853.CC2A15B6D@keescook>
In-Reply-To: <202501100853.CC2A15B6D@keescook>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 10 Jan 2025 20:14:45 +0100
X-Gm-Features: AbW1kvZ4pMJnY-qY0554TyvGljDcZVdXrEPN86cTu0FEJksQIusKVQpn3Io98LY
Message-ID: <CAGudoHGR9nbSDTUXt02vi5VmNn4eOFbgNiTfvTThA7Kecz4SWQ@mail.gmail.com>
Subject: Re: [linus:master] [fortify] 239d87327d: vm-scalability.throughput
 17.3% improvement
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nilay Shroff <nilay@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 5:58=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Jan 09, 2025 at 11:01:47PM +0100, Mateusz Guzik wrote:
> > That is to say, contrary to the report above, I believe the change is
> > in fact a regression which just so happened to make things faster for
> > a specific case. The unintended speed up can be achieved without
> > regressing anything else by taming the craziness.
>
> How do we best make sense of the perf report? Even in the iter case
> above, it looks like a perf improvement?
>

The kernel without your change compiled with gcc is leaving
performance on the table in select cases, namely when it elects to use
rep movsq for sizes below a magic threshold (depends on uarch).

Your change has the unintended side effect of changing
copy_page_from_iter_atomic to use plain memcpy, which justhappens to
be the right thing to do for this particular consumer.

However, it also has a side effect forcing of a memcpy call in places
which were optimized just fine -- for example if there is a spot where
there is a variable number of bytes to copy, but the range is small
and the upper limit is also small, gcc will elect to emit few movs and
be done with it, which is faster than calling memcpy. That is to say
for spots like that this is a regression.

In terms of optimizing all of this, the thing to do is to convince gcc
to not emit rep movsq for known problematic cases. But also not mess
with places which are optimized fine.

--=20
Mateusz Guzik <mjguzik gmail.com>
