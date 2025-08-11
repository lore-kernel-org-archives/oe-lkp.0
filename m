Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AE2C21F8
	for <oe-lkp@lists.linux.dev>; Mon, 11 Aug 2025 21:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947940; cv=none; b=Of/8Ukl30wLXhBnnPHzyKwE4uPllpada+CW/aCOop4vSedOjhPo1/5zr12kbdAGE20Y4rE/0jdA7OODWJXbGv2T6mK7Jeac5xYv+kxyf4b7S5Lxsv38/6XkzWjfbcJuejBDikU6OqcrQtRVVbGjyCu3VTr6eNP7jm09QBDmfptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947940; c=relaxed/simple;
	bh=Wp2SaX8CG7tM/UQZ7ITcbfAUzMlUdJy5a17ix7IDRPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB81lsOP+10SwohfkWw2wBy3RWWu22QlckT5PQHNu3FfSEaojFfdlZRwjnhQyUMUWX/vmUGYQ6AsiRKKoDxyaVS59dpPuZSdErmmwJRrVDnv98XXqj/apQLbqGBx+65/OA4P9snxPHaki2/608Y8HLmJzLhMcwm3iBtlkxmYXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FMpYd7dO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FMpYd7dO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af949bdf36cso769332966b.0
        for <oe-lkp@lists.linux.dev>; Mon, 11 Aug 2025 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754947936; x=1755552736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nq/BuyAKv3pgMr4iqsCzwNSRSbvLzOuBXkj4nE74O0A=;
        b=FMpYd7dO7gpZYExXWHgLBknlbTvzVNNk8rSJYqpE9sx6feiR5kcJpWMgf8cb/ScMvF
         U7C9howCami5UgLbcgVI0cZdnRyXALaR9CFJtHadQMKj5dQGyQbaDqcEWWJwUrJmmHTO
         hdqcBD71B0XHhQ4y6BqKkF06teuLZVkavcASzG089luicsLLZny4a56ZzgysjaDP4Kq3
         2DwNYDJ4rP4Y+0wNF7WZehsRGQStQm1WI8hskKBHFobyJnTVg4ML3dSZkXdIZhfpvApu
         xz0BuFa1Jn8cwwBtWLhfCZtrzZaRcE4Ne/wJSMcDEL/IjtV5PdTCSNwdTI+rDJyIHFgk
         Q/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754947936; x=1755552736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq/BuyAKv3pgMr4iqsCzwNSRSbvLzOuBXkj4nE74O0A=;
        b=iHgzYEprCsPwWXT3oC/gR0Zzmu4Vx6C/FfzgwY6FP2deV4n75OMBtaVoK3QBY+RHCQ
         Bjxw30/Lrh82EocUmwAOw4xLhWHxzvWQb88cvMZDXM3aqJ6JaS7jeSqhNg3IxlcE/eMv
         2tkOJlLCOkd1NNj/MWYa5fkpCSonfI1iDvdOdWhwvqntfXq2txfEARFtcTSiByry/f7k
         oZ2onvBdvnOqGnrbFX5IvBEYY5bKgdtWFUmcNY3/ryrCmlrvgN3inU2CXbIrtApXtIvX
         QJAGEg9HsNK6qjvNKd0lE1LrSkvGnlR728yx0IikU2aLHKIK69NrFFQtrz7z2ZejSH/z
         Q9lA==
X-Forwarded-Encrypted: i=1; AJvYcCWUKWDPYoAcMaTVLNMQLQnl/iEanNP1GBpnBkP+InGFki7QPRUgrXegLOfTg6xKyA6EUjHrbUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3NTDXibNq6eWWlIZEkKCbRCmXNmZXjkSWaWzNfM/X2GYyQPRI
	NvkRh5Nt82cTN0wxjs3DcXq4AvJ79s4WdWm1WwlV+zSUj7raXrZgci7vQGsicE1miJA=
X-Gm-Gg: ASbGncv87qKgryTyrOOQUSEJoQkn0/GNf1N82GyRaD2AsOaplTGbDwVam4EnNDQ/JXl
	enAp4Djc3RhqP77gbKDnvzMxlXfCqMjKjx7UUg1SlGx1tf3y+xymnl41I4VEc33BqOqCRPmOpPZ
	UXiyNwM0tfEJMzsMfYZKpxyYfMb9T3j3O4XRDKwwamscQQHFZQ/RavtK0djmiYW/lrxXvgiLRyH
	QVmWgOKh0IAIHcr6nPQLa3rkBmxEjtHORYKORJE6NqE8YSEfjED8Z4qPLjJV12X7Cf2aFWIvq8I
	pjsE1RAKtWJHDpSdI/Oon4vJ+QwJTB+acKe3QkJttji9oEz0F06w2xEqOXDEMlmLUQZhaHM4LQp
	xcUCaTE2W7dG6
X-Google-Smtp-Source: AGHT+IEpI2h9lIY/AO/fTtYcOoO4khM0ZEAiZvU2fi3EuMjQtsrWd8CdH2Opy3n0PnI33xPN+ZeMCQ==
X-Received: by 2002:a17:907:7247:b0:af9:6813:892e with SMTP id a640c23a62f3a-af9c653ab3dmr1329549066b.51.1754947935930;
        Mon, 11 Aug 2025 14:32:15 -0700 (PDT)
Received: from blackbook2 ([84.19.86.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3981sm2069766266b.35.2025.08.11.14.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:32:15 -0700 (PDT)
Date: Mon, 11 Aug 2025 23:32:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	cgroups@vger.kernel.org
Subject: Re: [linus:master] [selftests/cgroup]  954bacce36:
 kernel-selftests.cgroup.test_cpu.test_cpucg_max.fail
Message-ID: <lsnebzejrxrpulxxmyvkfdrsplbi2ft2n5zuux3dl3ewt5ihrs@j3umrzndddsb>
References: <202508070722.46239e7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35rdoq4zxkxl7xa4"
Content-Disposition: inline
In-Reply-To: <202508070722.46239e7c-lkp@intel.com>


--35rdoq4zxkxl7xa4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linus:master] [selftests/cgroup]  954bacce36:
 kernel-selftests.cgroup.test_cpu.test_cpucg_max.fail
MIME-Version: 1.0

Hello.

On Thu, Aug 07, 2025 at 01:52:31PM +0800, kernel test robot <oliver.sang@in=
tel.com> wrote:
> dfe25fbaedfc2a07 954bacce36d976fe472090b5598
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6           100%          6:6     kernel-selftests.cgroup.tes=
t_cpu.test_cpucg_max.fail
>            :6           100%          6:6     kernel-selftests.cgroup.tes=
t_cpu.test_cpucg_max_nested.fail
>=20
>=20
> not sure if there are any necessary env setting? thanks

The selftest commit essentially changed the tolerance margin from
ridiculously large to something that looked statistically appropriate
[1].
However, when I run the test (30x) on the 954bacce36 I get:

quantile([D1 D2 D8])  # 1 2 and 8 vCPUs respectively
ans =3D

   1.3086e+04   1.1559e+04   1.1177e+04 # min
   1.5109e+04   1.2936e+04   1.2989e+04
   1.5791e+04   1.3938e+04   1.3788e+04 # median
   1.6159e+04   1.5385e+04   1.4980e+04
   1.8757e+04   1.8699e+04   1.9494e+04 # max

I obtain similar values also on v6.15 (the kernel + 954bacce36
selftest). So it's not anything in throtlling implementation affecting
this.

The tests above were with HZ=3D250, for HZ=3D1000, I get slightly smaller
results with D2:
   1.1753e+04 # min
   1.2634e+04
   1.3208e+04 # median
   1.4010e+04
   1.6937e+04 # max

But still nowhere the 20% margin (i.e. values_close(...10%)), these
values would demand up to 100% (values_close(..., 50%)). Or add a bias
derived from sched_cfs_bandwidth_slice_us or increase the tested quota
=66rom 1% to 5%, that'd be an improvement:

   48882 # min
   52450
   52941 # median
   54284 # 75th percentile
   73186 # max (limit would be 60000)

I'm not sure how big overrun we want to accept as a pass.

Michal

[1] lore.kernel.org/r/20250701-kselftest-cgroup-fix-cpu-max-v1-2-049507ad68=
32@sony.com

--35rdoq4zxkxl7xa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaJphRAAKCRB+PQLnlNv4
CDorAP4j+gBfzJ9mjsTBBUy9uD3wIzoL2opwDNhFmTuGsKuCuQEA3ayfCV8VdA6/
OKdE1A/l6w776aNK35BBRJ+Oz9FgxAE=
=A67z
-----END PGP SIGNATURE-----

--35rdoq4zxkxl7xa4--
