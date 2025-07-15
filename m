Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FDA262FD2
	for <oe-lkp@lists.linux.dev>; Tue, 15 Jul 2025 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566267; cv=none; b=Xgov6B73zmYeDI/zvtTCiHhd6imKkV7Ur0WJfBQ/7JRgTzJM2LBpGb4VqH6pt9ApMMI9j+5VuLEPiSA2myCLdfGmy9hbGzTkEqXiGAFS1TNvrF0UoXLP4Qv0W1VxL0ojJzxOFHG2L5fVoPpG1RK3Vf66RQhs74iicAnavDQzG2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566267; c=relaxed/simple;
	bh=fTkn3eXAD0eJYXRekYRqa3rDNvdGjNspToUupDCBuso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIYEZepUp5S88UcbrxjJfKa1I33JUza3UDUhBmSq2mtz+wJfacdAnKVvb93Yur88vbgADJDqBvf5z4WGDElgQsPhRiOoaJhETzopniQTYNrWubg2D8vsgren9EDXdwy7VF3DmHT4TnV/ssGmeAkKLY+AqzRz0c5ORCrn3ATYCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TPGbNa1e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DYK2Chfs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TPGbNa1e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DYK2Chfs"
Date: Tue, 15 Jul 2025 09:57:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752566257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPVzqmxRxYsGvSv+hkg4vDC8LGHJ5NfLqt0LazWIkK8=;
	b=TPGbNa1eTH70Ut+vDtjiB4yxUN0RD+IhXcF5pOOK1oUL+inqbKJ6fFR98cUVDYx7eM3wTK
	cV/9EBKupQTCadBbsVJvRCP9BsX5D1NQKKFyOl5lpWHAhCSorfigbxRR+1wZuGcDKLAVqE
	RTym9W7vKSu3E2AoBHN7zS8uMrsBK9QT6DGiprrWyZjnz8TkuoPo7L36hWV6OAwHfIaAj3
	R0+9d+0DCT0/7WnJPp++iLmeNmkvGrrGSuqNolVBXCAXaH/+tK/6HqdDCiyCX1vdNeUz8r
	ggYeeXEdxwjavlyeaypgmXb4XLrcFU+kv6OqeL0wPo7pv5KsZ+JzS39732N8fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752566257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPVzqmxRxYsGvSv+hkg4vDC8LGHJ5NfLqt0LazWIkK8=;
	b=DYK2ChfsKMSCDBa1GXVH88w2zgE/5LTywtDCrkogBFFV6dGkRhBgBCy8Gotjoic8KDakHK
	bMu/t9Z5A6gCMzDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linus:master] [selftests/futex]  0ecb4232fc:
 kernel-selftests.futex/functional.make.fail
Message-ID: <20250715075735.tdXLHcEA@linutronix.de>
References: <202507150858.bedaf012-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202507150858.bedaf012-lkp@intel.com>

On 2025-07-15 15:36:13 [+0800], kernel test robot wrote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed "kernel-selftests.futex/functional.make.fail" o=
n:
>=20
> commit: 0ecb4232fc65e659ca7020f8bb2e0fc347acfb7d ("selftests/futex: Set t=
he home_node in futex_numa_mpol")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>=20
> [test failed on linus/master      bc9ff192a6c940d9a26e21a0a82f2667067aaf5=
f]
> [test failed on linux-next/master b551c4e2a98a177a06148cf16505643cd210838=
6]
>=20
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-7ff71e6d9239-1_20250215
> with following parameters:
>=20
> 	group: futex
=E2=80=A6
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-9.4-ksel=
ftests-0ecb4232fc65e659ca7020f8bb2e0fc347acfb7d/tools/testing/selftests/fut=
ex/functional'
=E2=80=A6
> futex_numa_mpol.c: In function =E2=80=98main=E2=80=99:
> futex_numa_mpol.c:213:31: warning: implicit declaration of function =E2=
=80=98numa_set_mempolicy_home_node=E2=80=99; did you mean =E2=80=98SYS_set_=
mempolicy_home_node=E2=80=99? [-Wimplicit-function-declaration]
>   213 |                         ret =3D numa_set_mempolicy_home_node(fute=
x_ptr, mem_size, i, 0);
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                               SYS_set_mempolicy_home_node

I assume libnuma-dev is around because there are not any other warnings.
That is unfortunate but it seems that numa_set_mempolicy_home_node() is
only around since v2.0.18.
Is and update doable? Otherwise I would have to disable the test.

Sebastian
