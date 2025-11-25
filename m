Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849D13C8EA
	for <oe-lkp@lists.linux.dev>; Tue, 25 Nov 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065637; cv=none; b=V7cmpCGtEFmTYmAWgbCo1hi0snvbVTdWJgVDEEzAX5Hyrx99PpLQ7RTGQzySpgmQhklO27Lnb1SVcLAhnpvfqKGka87yCGHP1uqazc6f04xGiNBIBWBDEci4rv0Xvo05frItepkM9ghHCCPERaim5AcvoeUsBFnxVozkvHXU+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065637; c=relaxed/simple;
	bh=FYWIni38RTzd1CvEvbvTzALDqCohw7fzt/zsirLe/pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOJ9g+SkiWfA0ZshHVXhFzuuQG82v18sibIhqrBGwX/ZPElL3CFyc0mJVAlQefw4zVaQ+prD3dByUqTs5v0/SSvDct8/oBn+jeKQ8FiifunDE1xXxveZFkjXBYuwwa/GmjAa6owqEgP+sVvqezU/aso7jQwBcXTb2cwgQEyoRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T7WVfC/h; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T7WVfC/h"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso32138275e9.1
        for <oe-lkp@lists.linux.dev>; Tue, 25 Nov 2025 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764065634; x=1764670434; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akkccM3IvNNQmmkmFRy2a+JX92ormoEOBN5rH1qdfnI=;
        b=T7WVfC/hnpGN9He/S93fcV9E9ypG3zFTzq36onrJkZVCnslffOMPUPVKgTul5RMmi7
         G9/ZRw8owWUDIgtXAsEtoTZmKpE5yws8xMbicZGgFsfHh8VWp0xXfXBElSZbtTYVo3+Z
         xhMffvkb41ZziCHKPus8qdZDfTGGnozu3ZX6Kl864bKljVhn24Qi6/7UICyOENUHXfyr
         nhQDzKU0J2er8RnC+rDM8K3g+mMbteFn1iIZ4ve0fKdnF/nIKG9NHFdbxBsQk0OIQN8E
         4hbf2mtU6dLSM3I8mTVLtkPOlbhugzym8fDoabXCbsLPH8bUk+vN10O54NCXM1EcZXiJ
         Z26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065634; x=1764670434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akkccM3IvNNQmmkmFRy2a+JX92ormoEOBN5rH1qdfnI=;
        b=SzUWiPUHWGYbcLHINd876c4CTFuwY8UJRm4bMQi9UBvBkfYhY4UHauRgU++R3U3TAf
         mWVAinTizS5Ckn9ouNwU9syFRfYr+d5a82d8IGQp2G3++t+Io5OzMSfh37X/xmiyRrd8
         EIsUQrgDWzd0N8oAS/IaNF7GqCYMUMUzs1CcBW4sazUivDYukE4T6b/fHPO6is4TCTEg
         dTzVK0LdmqraWFIMDgvXtpsk8GagDSTmIsrfdcJityT5GQFW7d28gbheJeC2urK2Npzf
         wYluzt3pa2NhfO+5yax3xAYKBYdahd0UmV7KDXjtnAnZaN0yAylIkcLFpmskRSJhUKCK
         PoIw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7vTZOGUepicERxJzUCS1YixKW3l8z7YKWaS8Y1rBAlbU+7uNVxQKFsSsu5za5vI6mcRiRYE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKIT3p636ngK949IVzO8iYgCK0aqQWoep6vznhgphghNevhLPl
	cODabsmJpkIUyM0u5ycTVZAgVCH+WD9RXIaWXcHn7c+fk6febkmlAM1FTB/HNaAL2w==
X-Gm-Gg: ASbGnctIR2gnNNA5ncXE8JdA9B/cp8pGeTGdMhq6l5Jw48vYH9E/Rm/O7za2fRdu6OS
	CQDh1NOs4ZY+w4Ksg192yCz7a76BqYYi42BDv8gxkXIJeeCysHTwEL7Qm69hT3zl+BhakKWr8+N
	gJBTAU9+11bFPV96na6eu39b5NLcTzrGESVgry9HkoK3T04JBR4PUQb8JVUxlk26N1okYNTxl/h
	ZhAqQo/FBk23R09WbkQkDgEnHO8425+oxExN0RX0SdNWxbQJcFISjBvUtPvTiTdYVpH87VF7m+G
	eXO4qGRRwJZYJ+1jPN0nLl27f22hS8iLIYfu3Dvfj4/dy/An9PS4Vmw7Ehayc6dzWBl4OJVMjPR
	mX6g4CZSSOYnnYam7CCCDovVO+QNnXNtsqFwXo+2livLu94gnp8/j3swM4NxqUMmCkYTI5S7Ql2
	v4yk9f0O3BYANrqN9bui/gLqs6ObF8
X-Google-Smtp-Source: AGHT+IEghEzgUX7Y0DHR7Corjv/jFDgAqklVg667PjjHhJI7QMm8NG+RfxT3xnDSPr2BmlCO19kDgg==
X-Received: by 2002:a05:600c:a08:b0:477:aed0:f401 with SMTP id 5b1f17b1804b1-477c11254damr147976645e9.23.1764065633880;
        Tue, 25 Nov 2025 02:13:53 -0800 (PST)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm35140056f8f.29.2025.11.25.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:13:53 -0800 (PST)
Date: Tue, 25 Nov 2025 10:13:51 +0000
From: Wei Gao <wegao@suse.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Andrei Vagin <avagin@google.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev,
	ltp@lists.linux.it
Subject: Re: [LTP] [linus:master] [fs/namespace] 78f0e33cd6:
 ltp.listmount04.fail
Message-ID: <aSWBX1urcixS1Fl8@autotest-wegao.qe.prg2.suse.org>
References: <202511251629.ccc5680d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202511251629.ccc5680d-lkp@intel.com>

On Tue, Nov 25, 2025 at 04:33:35PM +0800, kernel test robot wrote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed "ltp.listmount04.fail" on:
>=20
> commit: 78f0e33cd6c939a555aa80dbed2fec6b333a7660 ("fs/namespace: correctl=
y handle errors returned by grab_requested_mnt_ns")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>=20
> [test failed on      linus/master fd95357fd8c6778ac7dea6c57a19b8b182b6e91=
f]
> [test failed on linux-next/master d724c6f85e80a23ed46b7ebc6e38b527c09d64f=
5]
>=20
> in testcase: ltp
> version:=20
> with following parameters:
>=20
> 	disk: 1SSD
> 	fs: btrfs
> 	test: syscalls-06/listmount04
>=20
>=20
>=20
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz=
 (Ivy Bridge) with 8G memory
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202511251629.ccc5680d-lkp@intel.=
com
>=20
> 2025-11-20 21:35:09 export LTP_RUNTIME_MUL=3D2
> 2025-11-20 21:35:09 export LTPROOT=3D/lkp/benchmarks/ltp
> 2025-11-20 21:35:09 kirk -U ltp -f temp_single_test -d /fs/sdb1/tmpdir
> Host information
>=20
> 	Hostname:   lkp-ivb-d04
> 	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
> 	Directory:  /fs/sdb1/tmpdir/kirk.root/tmp9k8rfwr2
>=20
> Connecting to SUT: default
>=20
> Starting suite: temp_single_test
> ---------------------------------
> =1B[1;37mlistmount04: =1B[0m=1B[1;31mfail=1B[0m  (0.016s)
>                                                                          =
                                                      =20
> Execution time: 0.085s
>=20
> 	Suite:       temp_single_test
> 	Total runs:  1
> 	Runtime:     0.016s
> 	Passed:      7
> 	Failed:      1
> 	Skipped:     0
> 	Broken:      0
> 	Warnings:    0
> 	Kernel:      Linux 6.18.0-rc1-00119-g78f0e33cd6c9 #1 SMP PREEMPT_DYNAMIC=
 Fri Nov 21 04:59:36 CST 2025
> 	Machine:     unknown
> 	Arch:        x86_64
> 	RAM:         6900660 kB
> 	Swap:        0 kB
> 	Distro:      debian 13
>=20
> Disconnecting from SUT: default
> Session stopped
>=20
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251125/202511251629.ccc5680d-lk=
p@intel.com
>=20
>=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20
>=20
> --=20
> Mailing list info: https://lists.linux.it/listinfo/ltp

I guess LTP failed message is "listmount04.c:128: TFAIL: invalid mnt_id_req=
=2Espare expected EINVAL: EBADF (9) " ?  Since i have not find LTP failure =
log in this email thread.

Base on kernel change remove spare and add new mnt_ns_fd but LTP listmount0=
4 still set spare.
I suppose LTP case need update base latest change of kernel?

Kernel:
  */
 struct mnt_id_req {
  __u32 size;
- __u32 spare;                                   <<<<<<<<
+ __u32 mnt_ns_fd;                          <<<<<<<<
  __u64 mnt_id;
  __u64 param;
  __u64 mnt_ns_id;

LTP case:
 {
=2Ereq_usage =3D 1,
=2Esize =3D MNT_ID_REQ_SIZE_VER0,
=2Espare =3D -1,                                              <<<<<<<
=2Emnt_id =3D LSMT_ROOT,
=2Emnt_ids =3D mnt_ids,
=2Enr_mnt_ids =3D MNT_SIZE,
=2Eexp_errno =3D EINVAL,
=2Emsg =3D "invalid mnt_id_req.spare",
},

