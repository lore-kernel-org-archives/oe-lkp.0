Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A38239072
	for <oe-lkp@lists.linux.dev>; Tue, 24 Jun 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754227; cv=none; b=IRvd1Ey5KLRlIS9bb+OZtUXAaeOCT6ONgG4GQyXzxvgX67KrxYa6wEIndrFC+FiFWQ0iHSBre+DiLkAGB72H5wehJhTZYs3B3OUiMCICpCMXB3krbIHo0nfVVXxc/KDEvhP4x2yx9qFR2BSTs9XEtqZl+XFlramxHSlwNKTWLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754227; c=relaxed/simple;
	bh=4kbQs1QHkw0MCGDfcFksq9EpqAKAIJzmjM5mkiIyk6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozdCjz9Xw3fCsuvDeeOiGohd25TtMMMnbvr6/8gD8+rj/ZMTjtZMwS71LSGMIfd5nJufHQfn7DkOeYD+KxGibrfs/OSzyYqq2rRf4qZlJbkc8bZGBZiqLSRiteeiDsJBzD0R5HTO4YmG15bEKUUNNjboC/hfCLNB6wT74FgxDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZ5PW0QI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZ5PW0QI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750754224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yB2HIaPK8cDlKFenYZspkWhvifve0nz7CLuzPxEfiHE=;
	b=LZ5PW0QInptBYckG0S/Mj+6bmJvBKclHHi9knQ4uUPjlot+tWSWzdteMDH8c7pzIwCVvBp
	PKIu8poEdvzJWpXBFqUvmRQdQDMZj8d8SnNOeyCM4fyHcx9PukKjoZvkilpzZ0EtJ02WdV
	sTYu5fcRwgvadickuMioMvfVQRq27k4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-MM3fiSryO_Km5m6fQAQkiw-1; Tue, 24 Jun 2025 04:37:01 -0400
X-MC-Unique: MM3fiSryO_Km5m6fQAQkiw-1
X-Mimecast-MFC-AGG-ID: MM3fiSryO_Km5m6fQAQkiw_1750754220
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32ca160b4bbso668471fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 24 Jun 2025 01:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754218; x=1751359018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB2HIaPK8cDlKFenYZspkWhvifve0nz7CLuzPxEfiHE=;
        b=NZFf2dzYSrF7pwvAgxeU+UdL8EjiT9fOUrV+SfXT0sPMsTw+5FU1h3x6/5wh/vNuuh
         Pqev9rQ0p2Pvy2jChJ9ujf8pGJV37gRDYluElKF1K+MR+/Nj+Plq/f7hIy55G4nTF6jP
         iECD/eVStfh7nyITyJ5vJYNlG30PdTWSEqUww84R/UXm8Rzp0sAQGi9lNT9zal+pBc5o
         uZmqZCT24S82Ep7OBLuE72iystty4JtERVyK4JLX6kr2fUI6hzHhuNEQoSZe0kA/bMaj
         JCBMY+Bl18OEYD7IfRH5bx4si2bFEhIiS88qsdmxfIhz4hWTECwFX8XwmEv38F1SQE3F
         r6xg==
X-Gm-Message-State: AOJu0YyDsdzUVmL5P/JiFJcmXMIWrcVfTYh1qwokMl4PKiF6Lbt8fE1W
	5LiCqvV4IZXlrD0Jplve3JW2rD2TKNqoFrEcMiVgZLY8Py5sMi7zdBe7GBwB7JVipfBCqQmEdOT
	jCMumsKSudjcy78IHmQPBY5zI1kBusyRqv61cUq/+Q7vWJykY94EtM0DfBfKV2laD5pafBg5sax
	jM7Fe3H4vnuV2h9EL/MCXGdAE0Okvzd7Wr
X-Gm-Gg: ASbGncu1qVVmN5KzQOCd2tIGWZfvy1q80H0Cr0CdIqMC/3Dbjj+VyCcu/npHE85il87
	Pqu19kGrgAY+4ODkCq5Ulteq93pm2oC/H/xLp4sxSjqZTHp/H5PuBjV3YXXZs/ibqGTQaTrVTMN
	8yXVnk
X-Received: by 2002:a05:651c:1076:b0:32b:47eb:8bcc with SMTP id 38308e7fff4ca-32b98ed9d8emr32818161fa.13.1750754218113;
        Tue, 24 Jun 2025 01:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Fqy5T/sEhBrDS1m8B3dFpgOJjJ5YTCqJ5qB7lCWm7n+UlwPrgTto3FBNgPvYOpWOozDjdFGFdUPaLsq3pEg=
X-Received: by 2002:a05:651c:1076:b0:32b:47eb:8bcc with SMTP id
 38308e7fff4ca-32b98ed9d8emr32818071fa.13.1750754217627; Tue, 24 Jun 2025
 01:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506201427.baf6fdc2-lkp@intel.com>
In-Reply-To: <202506201427.baf6fdc2-lkp@intel.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 24 Jun 2025 16:36:45 +0800
X-Gm-Features: AX0GCFv0L0iiUVkzCGGJSJFNPeSq4LIaObZLEFFRH0o9gUiNFNG_UcBiq2O-YxM
Message-ID: <CALTww2-0v=60uxbgd=ideL8XQM0Tp_ZOwOkNhTrthC-U+zt4Hg@mail.gmail.com>
Subject: Re: [mdraid:md-6.16] [md] bc8ce8eaa2: mdadm-selftests.05r1-failfast.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Yu Kuai <yukuai3@huawei.com>, 
	linux-raid@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X_YhPn1dlAOft5sPX5ls-XxPealyEPZGZwUrTxdSr5g_1750754220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

It needs to use the https://github.com/md-raid-utilities/mdadm/ to do
regression tests

Best Regards
Xiao

On Tue, Jun 24, 2025 at 3:55=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "mdadm-selftests.05r1-failfast.fail" on:
>
> commit: bc8ce8eaa290a198cb5303181041aad037299b7f ("md: call del_gendisk i=
n control path")
> https://git.kernel.org/cgit/linux/kernel/git/mdraid/linux md-6.16
>
> in testcase: mdadm-selftests
> version: mdadm-selftests-x86_64-0550fb37-1_20250518
> with following parameters:
>
>         disk: 1HDD
>         test_prefix: 05r1-failfast
>
>
>
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GH=
z (Haswell) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506201427.baf6fdc2-lkp@intel.=
com
>
> 2025-06-19 10:07:43 mkdir -p /var/tmp
> 2025-06-19 10:07:43 mke2fs -t ext3 -b 4096 -J size=3D4 -q /dev/sda1
> 2025-06-19 10:08:14 mount -t ext3 /dev/sda1 /var/tmp
> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> -e 's,{MAP_PATH},/run/mdadm/map,g' -e 's,{CONFFILE},/etc/mdadm.conf,g' \
> -e 's,{CONFFILE2},/etc/mdadm/mdadm.conf,g'  mdadm.8.in > mdadm.8
> sed -e 's,{CONFFILE},/etc/mdadm.conf,g' \
> -e 's,{CONFFILE2},/etc/mdadm/mdadm.conf,g'  mdadm.conf.5.in > mdadm.conf.=
5
> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
> /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d/=
01-md-raid-creating.rules
> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63=
-md-raid-arrays.rules
> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/=
64-md-raid-assembly.rules
> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/ud=
ev/rules.d/69-md-clustered-confirm-device.rules
>  [1;33mWarning! Tests are performed on system level mdadm!
>  [0mIf you want to test local build, you need to install it first!
> test: skipping tests for multipath, which is removed in upstream 6.8+ ker=
nels
>  [1;33mWarning! Test suite will set up systemd environment!
>  [0mUse "systemctl show-environment" to show systemd environment variable=
s
> Added IMSM_DEVNAME_AS_SERIAL=3D1 to systemd environment, use "systemctl u=
nset-environment IMSM_DEVNAME_AS_SERIAL=3D1" to remove it.
> Added IMSM_NO_PLATFORM=3D1 to systemd environment, use "systemctl unset-e=
nvironment IMSM_NO_PLATFORM=3D1" to remove it.
> Testing on linux-6.15.0-02014-gbc8ce8eaa290 kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-failfast... Execution time (se=
conds): 8  [0;31mFAILED [0m - see /var/tmp/05r1-failfast.log and /var/tmp/f=
ail05r1-failfast.log for details
> Removed IMSM_DEVNAME_AS_SERIAL=3D1 from systemd environment.
> Removed IMSM_NO_PLATFORM=3D1 from systemd environment.
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250620/202506201427.baf6fdc2-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

