Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4BF1DE889
	for <oe-lkp@lists.linux.dev>; Wed, 25 Jun 2025 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750829235; cv=none; b=YvYT08H9wnpM+gOTmPRQwR5I0EtbN1OwvjmcJzNUBfmq9TDnrfPVfi4sAxMKpQTfoJ/hMeWqc6P98z6CPwFMBuCjBuMdNJ01fHisFzJRQ5iImmrhz8/fhk2jte/jiWtEzPEFcWGknUmXrV+p4NRmGehSXrUVcDTQPhuWdx+Q0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750829235; c=relaxed/simple;
	bh=LbnRgsJqaYQR3w0VmAPK39nvGAGLmgdt/bvT0e9diq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeFw21UNWQoFmmHFDfS8twBlLkrYkWdyiKliA9RLsPj3uu623NCf3cBos6QoET6mffH+CgaG0LttwGxSnSlBXQ1BnFIG4kJtttJHHXmhXvaFYj1/1HnybJlijdRpmOGXk3y4BSn8t++wpY+roR8LHs8CbPxcmfVNS7auZ3Usx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CW1C+kLT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CW1C+kLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750829232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpRDJtOibAN+hjHG0vQSfnGW8FBJuEequnOWRE9i4jE=;
	b=CW1C+kLTYkj53hL9be6LxsE5d1qo2LdiCLeXS442AufZQXTM1qr5q3D7S8TZMr5usdVJSK
	ICPXDyZS9oaCh+gNYx65KsWwmGKE1QrdTxAuBHRslyO+YN3nC4BbUKP+MUhc4z1eubgTvu
	xMAdC+AfgtuH2QMlq3XZTFNTS3CHyaI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-xpiqbCy_NmOD5L3GXdx3Lg-1; Wed, 25 Jun 2025 01:27:10 -0400
X-MC-Unique: xpiqbCy_NmOD5L3GXdx3Lg-1
X-Mimecast-MFC-AGG-ID: xpiqbCy_NmOD5L3GXdx3Lg_1750829229
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32b500a9a28so25194661fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 24 Jun 2025 22:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750829228; x=1751434028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpRDJtOibAN+hjHG0vQSfnGW8FBJuEequnOWRE9i4jE=;
        b=Cc6CSDLAJRBMqkcKDCp08w6itFvY7z09769Hd8Xhq+J7WV0s6B+IqEy8y2JEmERtrg
         MWlctyeiAqsUA5KcRQiuQH+ylvlQSp2IBXE2YqBpy0ozUDrGYJwhDL7zwOcFY7CU3IT5
         Pp7t4jfO1U0JUPvSJ3ViPxLFJgZEIZTCh05gDjHEqLVnRF1/A2/SFScSl0Ncolnn9o2p
         6K0nUVMLt/k/Mah5s985wOHN4dn1i8augUlDbExKCInQL1GpiPhCsRJW9tRxRLVyo2Z8
         7W6ExL4onnY5iIi7o4QWh4vRX1S0+DguC5spUMCuN02AuYRCT0P4eNOMRUXG37+evUFY
         UPkQ==
X-Gm-Message-State: AOJu0YxU5Kh93oopynLZ/Fge0REBrXeoyVQTC3DQZoHv+/+IttDYcTzW
	kf60x9w3mo4vX8Fz5qsa/JbIweXPk35zEFyI0UJ6e5jFeO6s5sI5N3ZVTxxtl1k2jZRMX1T7zUK
	0x3K9EpvLiHrRQ9sJmhJ2dC3xF/+MBtVjzmFSV/6XIm86Da6pxmSTbNLj1p+Bqi3Zz9y/YizTO4
	dwITAZ/bul3SRO1GaYu6R1qdLQjdcdW3c1
X-Gm-Gg: ASbGnctPK3YKwFrakhZWyv4a0yqvhegK5ImfEvnnSXdnmyI80FMyD62LTV73G0mOpJ9
	OWkm0hIUGWwyHFxTMTCrMHYzU79XWLpoF1KkzNRppELSu3NCR/qIuNAgC9vngeNrpcmre/APvf6
	JcQGV0
X-Received: by 2002:a05:651c:2105:b0:32b:8e39:b0c7 with SMTP id 38308e7fff4ca-32cc65c8421mr3102391fa.40.1750829228029;
        Tue, 24 Jun 2025 22:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4iD6cGnxdZpUazM6a1CSqutw5GLV74iOBbDL8UdlQVnJmXxorI9+IC+cjSOu6aWAn2nDVewdVsiUwVpu04+c=
X-Received: by 2002:a05:651c:2105:b0:32b:8e39:b0c7 with SMTP id
 38308e7fff4ca-32cc65c8421mr3102331fa.40.1750829227527; Tue, 24 Jun 2025
 22:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506201427.baf6fdc2-lkp@intel.com> <CALTww2-0v=60uxbgd=ideL8XQM0Tp_ZOwOkNhTrthC-U+zt4Hg@mail.gmail.com>
 <aFtgsw+bARwZSQQI@xsang-OptiPlex-9020>
In-Reply-To: <aFtgsw+bARwZSQQI@xsang-OptiPlex-9020>
From: Xiao Ni <xni@redhat.com>
Date: Wed, 25 Jun 2025 13:26:55 +0800
X-Gm-Features: Ac12FXyOmw8RcnOj0aLzkzz5hWpInf0qH4Sz2bl3LkDQ77l25u-JtaLCzbSh4hQ
Message-ID: <CALTww2_xT2Awcn4V+NS1kwsWv0p2z+e+Y155Y-LhKm9cGPrH3A@mail.gmail.com>
Subject: Re: [mdraid:md-6.16] [md] bc8ce8eaa2: mdadm-selftests.05r1-failfast.fail
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Yu Kuai <yukuai3@huawei.com>, 
	linux-raid@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ynaPWo31GZoaIK1qysE1RRZiagIofpVbF_Lo4wqT-O0_1750829229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:37=E2=80=AFAM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi, Xiao,
>
> On Tue, Jun 24, 2025 at 04:36:45PM +0800, Xiao Ni wrote:
> > Hi
> >
> > It needs to use the https://github.com/md-raid-utilities/mdadm/ to do
> > regression tests
>
> just FYI. we really use test from this link:
>
> https://github.com/intel/lkp-tests/blob/master/programs/mdadm-selftests/p=
kg/PKGBUILD
>
> pkgname=3Dmdadm-selftests
> pkgver=3Dgit
> pkgrel=3D1
> url=3D'https://github.com/md-raid-utilities/mdadm'
> arch=3D('i386' 'x86_64' 'aarch64')
> license=3D('GPL')
> source=3D('mdadm-selftests'::'https://github.com/md-raid-utilities/mdadm.=
git')
> md5sums=3D('SKIP')

Thanks for the clarification. I'm looking at this problem.

Regards
Xiao
>
> >
> > Best Regards
> > Xiao
> >
> > On Tue, Jun 24, 2025 at 3:55=E2=80=AFPM kernel test robot <oliver.sang@=
intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "mdadm-selftests.05r1-failfast.fail" on:
> > >
> > > commit: bc8ce8eaa290a198cb5303181041aad037299b7f ("md: call del_gendi=
sk in control path")
> > > https://git.kernel.org/cgit/linux/kernel/git/mdraid/linux md-6.16
> > >
> > > in testcase: mdadm-selftests
> > > version: mdadm-selftests-x86_64-0550fb37-1_20250518
> > > with following parameters:
> > >
> > >         disk: 1HDD
> > >         test_prefix: 05r1-failfast
> > >
> > >
> > >
> > > config: x86_64-rhel-9.4-func
> > > compiler: gcc-12
> > > test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.=
70GHz (Haswell) with 16G memory
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202506201427.baf6fdc2-lkp@in=
tel.com
> > >
> > > 2025-06-19 10:07:43 mkdir -p /var/tmp
> > > 2025-06-19 10:07:43 mke2fs -t ext3 -b 4096 -J size=3D4 -q /dev/sda1
> > > 2025-06-19 10:08:14 mount -t ext3 /dev/sda1 /var/tmp
> > > /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> > > /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> > > sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> > > -e 's,{MAP_PATH},/run/mdadm/map,g' -e 's,{CONFFILE},/etc/mdadm.conf,g=
' \
> > > -e 's,{CONFFILE2},/etc/mdadm/mdadm.conf,g'  mdadm.8.in > mdadm.8
> > > sed -e 's,{CONFFILE},/etc/mdadm.conf,g' \
> > > -e 's,{CONFFILE2},/etc/mdadm/mdadm.conf,g'  mdadm.conf.5.in > mdadm.c=
onf.5
> > > /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> > > /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> > > /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> > > /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.con=
f.5
> > > /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rule=
s.d/01-md-raid-creating.rules
> > > /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.=
d/63-md-raid-arrays.rules
> > > /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rule=
s.d/64-md-raid-assembly.rules
> > > /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /li=
b/udev/rules.d/69-md-clustered-confirm-device.rules
> > >  [1;33mWarning! Tests are performed on system level mdadm!
> > >  [0mIf you want to test local build, you need to install it first!
> > > test: skipping tests for multipath, which is removed in upstream 6.8+=
 kernels
> > >  [1;33mWarning! Test suite will set up systemd environment!
> > >  [0mUse "systemctl show-environment" to show systemd environment vari=
ables
> > > Added IMSM_DEVNAME_AS_SERIAL=3D1 to systemd environment, use "systemc=
tl unset-environment IMSM_DEVNAME_AS_SERIAL=3D1" to remove it.
> > > Added IMSM_NO_PLATFORM=3D1 to systemd environment, use "systemctl uns=
et-environment IMSM_NO_PLATFORM=3D1" to remove it.
> > > Testing on linux-6.15.0-02014-gbc8ce8eaa290 kernel
> > > /lkp/benchmarks/mdadm-selftests/tests/05r1-failfast... Execution time=
 (seconds): 8  [0;31mFAILED [0m - see /var/tmp/05r1-failfast.log and /var/t=
mp/fail05r1-failfast.log for details
> > > Removed IMSM_DEVNAME_AS_SERIAL=3D1 from systemd environment.
> > > Removed IMSM_NO_PLATFORM=3D1 from systemd environment.
> > >
> > >
> > >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20250620/202506201427.baf6fdc=
2-lkp@intel.com
> > >
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
> > >
> >
>

