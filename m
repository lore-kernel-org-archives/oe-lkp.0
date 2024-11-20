Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71621CC88D
	for <oe-lkp@lists.linux.dev>; Wed, 20 Nov 2024 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114459; cv=none; b=TM9vUU9EPUY3tQpxFzGEv4bpUSQzKWKvsylu7uOMYJWDw+dSJrS/2qhmFTSQGjmDJLw34X5Tc13A3n1D699V5ffXw6l4sWTZSQot01KIxu2sNcGNwGMyhhM4RJSAKt0aoV5yrFSm4on7/DawS1DXxVg+oQxV/96nBZe4DIADEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114459; c=relaxed/simple;
	bh=7TWK2ytm7MNgSDeUxLIUZ5M3Ez9MhcEr38nyFyhf6Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smoJp1YbCe8QoF1cJhI78EchXq6fV7yApr+t7r4BR9Etuexy4/btYc/P/i6Tpgqt8OklrY4Ect5OTLH7Do0eqaIfWitJw8NjYai9y4Gz/pQhyrCrkBD+r2lw9v6OYlVZak5EJ1ofj4UqSBjMqyeOFE2WWcmo/xOMaDyXT2izSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTLbGBQk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTLbGBQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1A4C4CECD;
	Wed, 20 Nov 2024 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732114458;
	bh=7TWK2ytm7MNgSDeUxLIUZ5M3Ez9MhcEr38nyFyhf6Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTLbGBQkW41iF+y916Ylupd7FA1uQe31G3t4fIXDsuLAS3j9IoFurOurPpGj1+iVx
	 3HK+1IfrJ9pV+L3+x2XHA/uEooypZmRQ5gUCNrPRq8Yywyx0w/39tlBGF2GllFt8H1
	 DrDQprI6OMTwxNnH26iyiBLS4Qtum5qv9KiDiY58q2/bk2HsRMXIW6OrPK/9Uj2NzU
	 N24eUvA2EY3iESLD3N4PZxHfOgTeQi8vjoK1UJ8pQlHf9u3tcvQRfNclQZSvdfFzgr
	 WLIIAHFrgf85u5fFk5/ZdatXqhnVhQr9aDwRkYrFHd7WEp/1oMogtDXsgHbByIWRny
	 346JCb/nJvrGg==
Date: Wed, 20 Nov 2024 15:54:14 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com
Subject: Re: [frederic-dynticks:kthread/affinity-v5] [kthread]  cd28de79b6:
 stress-ng.priv-instr.ops_per_sec 4.9% regression
Message-ID: <Zz34FneFIJpZpi_p@localhost.localdomain>
References: <202411051514.5ce58505-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411051514.5ce58505-oliver.sang@intel.com>

Le Tue, Nov 05, 2024 at 03:27:27PM +0800, kernel test robot a écrit :
> 
> 
> Hello,
> 
> kernel test robot noticed a 4.9% regression of stress-ng.priv-instr.ops_per_sec on:
> 
> 
> commit: cd28de79b6107158b9d3390eaf829ed778e6d839 ("kthread: Default affine kthread to its preferred NUMA node")
> https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity-v5
> 
> testcase: stress-ng
> config: x86_64-rhel-8.3
> compiler: gcc-12
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: priv-instr
> 	cpufreq_governor: performance

Just so I understand correctly the output of stress-ng. Having a higher value on
bogo ops/s (real time) means better performance, right?

Because then I would actually be seeing 6% improvement between before and after
this patchset when I try to reproduce.

Thanks.
