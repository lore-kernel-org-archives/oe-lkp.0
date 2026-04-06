Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D412C3757
	for <oe-lkp@lists.linux.dev>; Mon,  6 Apr 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466664; cv=none; b=asM8Q5bQM5WQHa6F/P17OLd0VEdEtF9Ysfjfxz1/0evCpWKZKm4kUyvOJosQm/dcwpgRrP0VcMMg1DBnyrRrJGSzXxdc5pzLfA3hR+CDn95quLkhfaQpcKOKzjQUMIrdUyPTaMS+9oeBi4ADnzQW7g36bZ5fHmlAkkET0gPGjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466664; c=relaxed/simple;
	bh=7x77WK+cfnfCiBMm3ic0DZMIF42RnA3NnFRERI/KHUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbbCGTjB9RQ5mvapxos9z4UBB2EBDB9hb5+ae7l5RHRsyTkij8uAFQO4IL67vIteRJl4a3lZVxomEEUPSeBzcgaD7BAYzKFwH16NicL+hjxOMsi8Pvzwr4HsHqFZ5pyfHxCtFwiwoUHMIvqyYmpxw0Z36Zg3YEmhyUCr0l3jIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=mLtD0Ksj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="mLtD0Ksj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775466654;
	bh=7x77WK+cfnfCiBMm3ic0DZMIF42RnA3NnFRERI/KHUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLtD0Ksjpf/hvIZiH539hAuWvPOppBXzIOo49JQ9rRZzFQiAyJ3vv8vFG6wgfYU+u
	 KESau4SDMTWFna0jfWEOKxWeNxVGBnBm82awoGHx0f8yHSuE7Ky2UbeYv6og86EthY
	 ZjSzN8GYaEn9GMm6sxeF7k5PC2cNYBUALfFvcEzw=
Date: Mon, 6 Apr 2026 11:10:54 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lkp@intel.com, oliver.sang@intel.com
Cc: oe-lkp@lists.linux.dev
Subject: Re: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr] BUILD
 REGRESSION f45ad0a3230a0f2acba54b0bd76d897a9b68f4da
Message-ID: <13675fdf-35eb-4d18-9bf4-3bd8fbe2a05f@t-8ch.de>
References: <202604061512.WALUGsDn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604061512.WALUGsDn-lkp@intel.com>

Hi Oliver and the LKP team,

On 2026-04-06 15:27:22+0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
> branch HEAD: f45ad0a3230a0f2acba54b0bd76d897a9b68f4da  uncore
> 
> Error/Warning (recently discovered and may have been fixed):
> 
>     https://lore.kernel.org/oe-kbuild-all/202604040309.wwvKyW4x-lkp@intel.com
>     https://lore.kernel.org/oe-kbuild-all/202604051945.yvQXxV6C-lkp@intel.com

These links don't seem to work. I am specifically interested in the
reproducer for "initialized field overwritten".

And thanks again for your service!


Thomas

>     arch/powerpc/perf/hv-24x7.c:464:18: error: assignment to 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
>     arch/powerpc/perf/hv-24x7.c:464:25: error: assignment to 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Wincompatible-pointer-types]
>     include/linux/device.h:157:27: error: initialized field overwritten [-Werror=override-init]
>     include/linux/device.h:161:27: error: initialized field overwritten [-Werror=override-init]
> 
> Error/Warning ids grouped by kconfigs:
> 
> recent_errors
> |-- i386-randconfig-002-20260405
> |   `-- include-linux-device.h:error:initialized-field-overwritten
> |-- i386-randconfig-051-20260406
> |   `-- include-linux-device.h:error:initialized-field-overwritten
> |-- powerpc-allmodconfig
> |   `-- arch-powerpc-perf-hv-24x7.c:error:assignment-to-ssize_t-(-)(struct-device-struct-device_attribute-char-)-aka-long-int-(-)(struct-device-struct-device_attribute-char-)-from-incompatible-pointer-type-ss
> |-- powerpc64-randconfig-r053-20260405
> |   `-- arch-powerpc-perf-hv-24x7.c:error:assignment-to-ssize_t-(-)(struct-device-struct-device_attribute-char-)-aka-long-int-(-)(struct-device-struct-device_attribute-char-)-from-incompatible-pointer-type-ss
> `-- x86_64-randconfig-103-20260405
>     `-- include-linux-device.h:error:initialized-field-overwritten

(...)
