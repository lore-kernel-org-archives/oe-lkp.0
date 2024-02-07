Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFF7F7FC
	for <oe-lkp@lists.linux.dev>; Wed,  7 Feb 2024 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707340671; cv=none; b=WlLeHxkXm122xNMTxIizkPlE/B2HNvRm6WWNmtk9TbbVaEy2adeCv6p2bQgaw+zFnj9Zf3GyD3Bt21VTdL3KXjBtrL2wIaVNWH7ykxYN8tW86++i0AWVlBHeZxDPTS31k7A4CCJeRk2qXsamQ8dhI2VDj2ESlkLzqye+3LNZRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707340671; c=relaxed/simple;
	bh=Ba9IZ3pUl8TpCnR9Jd7it+kUM9opZIu9RXK+QWz3H3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrdlHel4Ul4z9xSu5KHVKFeYPRwpWuxkxvCS25PHVD2HhiMgT03EWCeBNFG9gUbMtAbCYhy2RG6NJ8phI7pLzds/3aIg3fnYdsxPSwOojIgqpkFuVSzFC6NccPRiMd8vlBS3OztyJfQ9I5iUT23g64lfCqEKvA6YozNoETPNvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRIYkttP; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRIYkttP"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4c0245cba99so487227e0c.0
        for <oe-lkp@lists.linux.dev>; Wed, 07 Feb 2024 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707340668; x=1707945468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvSx5a+l696q8jT623oagqwn9B3zqwoxaKk/kQyBuUY=;
        b=YRIYkttP2LPBCy8rgbzoshLnqaaljqRUsdfqb7bR0fk44tfFau8khAQPQFSsGOzrW6
         g09IWixL0aESyAN+nIYpK8JPFA7QDNgiK5rwirgtN/hFuXbqTyfGa2bEvMRlNyv21pP4
         egTn2UyuAUUaXyizMb15qMord3JfvCpXEahzlEiogT7wEEMSIKRAbQHwhfV20sdvKJC5
         9q97rYbayNNfEn6564G9OV+OZRYdfeW/53pnyc2It/S+DTcBQ1yIUTauQ/8iv0huX65f
         9sjswl1hfZBHw05USvrAaR9yozpUE/DHksn845L7s/BkvonbqgaAfgli8SnBS/Pzh/ha
         eAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707340668; x=1707945468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvSx5a+l696q8jT623oagqwn9B3zqwoxaKk/kQyBuUY=;
        b=Mffg7xsBlxwhKMl4UrvsaOjkwdeQNkbidi5HyMwfUNlqe6qkIiniKiqiQS374RVDvE
         MuY/hyZBTdlQab4qzceBUxnVt1Ax1NvhTff5UeaSL06f6+OwjtAm+IVDTJzVq8D5wUk3
         xVqTHvYSW4iyORds3VH9nD+P9nnH8NkWag4hAdV8m4Jy4IHrva0p89D1QRkZcaWPwdrc
         Bwihq7H8qaosN1AEY9yQr4UIeKuH9v5I2YZ7voDHNNOWAvEyRZtMF/kFuG8y8xyg2nOs
         WEbg6+ZspNeCjykEaxph/Xy1hbj72Vm2MLUPUWRDsd5/DHFRjnHOiBvMgb1rwe25lTle
         YabQ==
X-Gm-Message-State: AOJu0YxfruXnZPtT3TNyIviz38XZ1VVBDukVItND6rqx7ijXUaS3wsBe
	O08Sd7ZxVob3oD8OEJia4tPN90QMSWacotWbUY58+J51Dh0yHYo6N1koVWa60AdPCIIn87G7UBw
	WB9njuz9M7o2m/XE010vmfkpvElY=
X-Google-Smtp-Source: AGHT+IHFHsknx4RZMWzUijrqkDBRJHFiIWHOE74sSkuK7XdkfVmQgDchHcW20TDXj44tgEl9Vvwh64R9sWGerpcEnYw=
X-Received: by 2002:a05:6122:181e:b0:4c0:1c6c:f346 with SMTP id
 ay30-20020a056122181e00b004c01c6cf346mr4192014vkb.3.1707340668134; Wed, 07
 Feb 2024 13:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402071553.75bfbe67-oliver.sang@intel.com>
In-Reply-To: <202402071553.75bfbe67-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 7 Feb 2024 23:17:36 +0200
Message-ID: <CAOQ4uxghgvmSzN_twab00xyUh=+0UJ79_pn-tjW1Ob_s1-zroQ@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fsnotify] 9c13a708ef:
 will-it-scale.per_thread_ops -4.2% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 9:37=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -4.2% regression of will-it-scale.per_thread_=
ops on:
>
>
> commit: 9c13a708efa02450fb5a50fc02a6eaf060fa00a1 ("fsnotify: introduce pr=
e-content permission event")
> https://github.com/amir73il/linux sb_write_barrier
>
> testcase: will-it-scale
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 512G memory
> parameters:
>
>         test: writeseek1
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202402071553.75bfbe67-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240207/202402071553.75bfbe67-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-=
spr-2sp4/writeseek1/will-it-scale
>
> commit:
>   v6.8-rc2
>   9c13a708ef ("fsnotify: introduce pre-content permission event")
>

Hi Oliver,

There is an optimization patch in Jan's fsnotify branch:

* 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher

I rebased my development branch over Jan's fsnotify branch.
Can you please re-test the regressing patch.

Thanks,
Amir.

* f3e926a9addd - (github/sb_write_barrier) fanotify: introduce
FAN_MARK_SYNC flag
* 57d3051b0107 - fanotify: activate sb write barriers for pre-modify
event watchers
* a2201e37ed93 - fs: hold s_write_srcu for pre-modify permission
events on aio write
* d2e5e6cbc899 - fs: hold s_write_srcu for pre-modify permission events on =
write
* 0c8c9bb221ff - fs: add srcu variants for mnt_{want,drop}_write() helpers
* 153a7af1d84e - fs: implement 'vfs write barriers'
* ea95472ceb68 - (github/fan_errno) fanotify: allow to set errno in
FAN_DENY permission response
* 696f2fde6da0 - (github/fan_pre_content) fanotify: report file range
info with pre-content events
* 757935d39017 - fanotify: rename a misnamed constant
* 3eab2d4e1ff5 - fanotify: pass optional file access range in pre-content e=
vent
* 49433d6fc066 - fanotify: introduce FAN_PRE_MODIFY permission event
* eccace27aebb - fanotify: introduce FAN_PRE_ACCESS permission event
* ad23b2ac6770 - fsnotify: introduce pre-content permission event
* e1a893090c4b - (github/fsnotify) Merge remote-tracking branch
'jack/fsnotify' into fsnotify
* b7dbaace3971 - (jack/fsnotify) fsnotify: Add fsnotify_sb_has_watchers() h=
elper
* 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
