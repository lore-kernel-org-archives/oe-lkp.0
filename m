Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE929BDB4
	for <oe-lkp@lists.linux.dev>; Thu, 26 Feb 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110010; cv=none; b=K7NMoVsiPeumdxgaQQwSG0QbSh2RmyCeB5AHRj+xLa1GqXNlF+X4z98y1stEytgNmv4yrjAjxVLNQ7ZxI5kJKBYkcdfflt4OpHLHD9pnzVBg4R5nQFBP9knGDfJpsWpgIphQJpzROd87QWuAIRjgjKXuzgYDvyqS9YzS1Z0+2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110010; c=relaxed/simple;
	bh=viQ25M3vtUzndTMaxmd5SD9bxmFxS52aBwla6KPdWN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQyG6aGPquEZL5UyBrShyNv9kzIrkJr8any8/spjdYD9b5Hn6QcWsPTkDbIJSeaTt/O64mSD6NaR7H9VcQSvuxC1uRCJVV2NKxCQrOc9+4cS6zigyKR45nr0FQxxqPHv7uovrvfKaqAMTUYSt0ujp24yjfTNgSVZDGel1ddWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=h/h5iR2r; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="h/h5iR2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772110006;
	bh=viQ25M3vtUzndTMaxmd5SD9bxmFxS52aBwla6KPdWN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/h5iR2rrUxz5OIlXzdHjwp8pjGcKDZT20vKDZ19hrhVFfW2Opj+hp4TqWkbXHQZq
	 Ycvh+7uLXFECQxUYExZF55yhyhbLW88OM3fh7YiIpQnq+9/1AWHfogh17pDN7Mi9tj
	 thO5yIR6WGy9mjHCaVBst7A8YFerxHZja1JcODgM=
Date: Thu, 26 Feb 2026 13:46:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux+lkp@weissschuh.net>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [thomas-weissschuh:b4/auxclock-nanosleep] aafb55d8d1:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <1d3e70c9-8174-42e4-8e2c-e0717c32b63c@t-8ch.de>
References: <202602262005.2ceb43cb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602262005.2ceb43cb-lkp@intel.com>

Hi,

On 2026-02-26 20:42:55+0800, kernel test robot wrote:
> again, since we are not sure the purpose of this patch, we make out this report
> again. if low value or you don't need this check, please let us know. thanks

Thanks for the report and sorry for not responding last time.
Indeed, this is only a debugging commit. The warning can be ignored.


Thanks again for the report and LKP in general,
Thomas
