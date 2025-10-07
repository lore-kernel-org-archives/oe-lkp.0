Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D71222D7A1
	for <oe-lkp@lists.linux.dev>; Tue,  7 Oct 2025 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759819508; cv=none; b=p+JcqBoNb9F3XQ7T5B0lA68R/9ROQFj+slLM0IZCGeRvUkrR3jHi6S9/M2T0opIuSbfl4lAUZiz+gPaFIFfZaDUlfvgobcGy87gtFrfVQifFIdL4JeAHYs9F0lohuqIIac97d0n2PWN88LPgPA319+tiZghEPpiXYtDEmmL1Frk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759819508; c=relaxed/simple;
	bh=Dg+fDc//iqXx6roS8o/mrUIgVewGTijV6CKFwUoWnnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JykFo+GkDF239vsaay+wHN5z/J4dE7w6p0EJvvHQkdnnP3/Pjme19PcxEU/q9SIxZduEkWvrlIyRltWQtgUOFgAckdCQwIVrDKtUMpTtS7PI4P7h9W/CO2IqWxrVu7//zQpx8azY2r6O52EwBlFEVX1hhgfXmbibwcHahC3pU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1D75C67373; Tue,  7 Oct 2025 08:44:59 +0200 (CEST)
Date: Tue, 7 Oct 2025 08:44:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@lst.de>,
	kernel test robot <oliver.sang@intel.com>,
	Dave Chinner <dchinner@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-xfs@vger.kernel.org
Subject: Re: [linus:master] [xfs]  c91d38b57f:  stress-ng.chown.ops_per_sec
 70.2% improvement
Message-ID: <20251007064458.GA19763@lst.de>
References: <202510020917.2ead7cfe-lkp@intel.com> <20251003075615.GA13238@lst.de> <aOJckY5NnB2MaOqj@dread.disaster.area>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOJckY5NnB2MaOqj@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Oct 05, 2025 at 10:54:57PM +1100, Dave Chinner wrote:
> stress-ng puts a fsync() at the end of every ops loop:

Ok, with that the numbers make sense.  Thanks for digging into it.

