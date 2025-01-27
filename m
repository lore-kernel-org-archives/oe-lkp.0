Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1843817B50A;
	Mon, 27 Jan 2025 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005982; cv=none; b=ip+BaoV/PhTK1ODWYj9JmnLLUvoclW7IU+HkUJ+cxy3U8vTaUzQECJDhB7eD2I5vq7XZD5Zr/GJGZFdahuBpEVnJvWjko/l//D2nB3/k3ajZfRGlR8WwgdPBeOhoHIvg2BVq3hYLfo0g5xYTPMKe2JcX411Tq8Z5FD7oXsLy8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005982; c=relaxed/simple;
	bh=UEaHWqhOv9jEehxU6PwxB68Jv6Qno8FvVC3tSK/vPdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtk8g+unj4UxI7k8a85WFn48wrY+h0qpHbKp5JWwTtP503ZaDlbH4zeyAibpfBZwYwYRqWfuI8cfNRCGLWAqCHL90WG67X2dvrCdCJeAyibyP8eTyzY3c3DSzz5NCP3GI3ycL9rdN96DmhXkTemhazA3Ge+/LnCtpmNP7HPIZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=lL2jwolP; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="lL2jwolP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=52/eOaP45wZqccmHoq5un7SzEExZETCllHKMOgNhSS0=; b=lL2jwolPnlpNeCJ8rSaIo+kYVO
	D2u05F1RwkGALJoFNss7oyCy1s8S1HykkTnOwskjrDU6UAmHgZ4CsZkxG7Fw5IhKqjOQz9ACJr/AR
	OEVq1VdqN5LwD9oIMgA2qFrznMmGBQohlIhSlPxwxSGRXTwCYUFEOdMMA44Mej4tcEMlA96mwwYKG
	MW8PrrSTw52SeqYuAGDsNx2SUZrsL8L79mJJ4oTfb+DvI0jCiiUX58O75tC/71qz/eGdX+tA+aL8D
	eTe8LYHT6mfu7ksvTe9QRbGU/FjrLQyfXlrj0x/UtJqG9IG1ff+l5OFrHnPQPJ7O8X2MO629Fcu3+
	fox5QGuw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUkS-0000000DZf2-2hb4;
	Mon, 27 Jan 2025 19:26:16 +0000
Date: Mon, 27 Jan 2025 19:26:16 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [linus:master] [do_pollfd()]  8935989798:
 will-it-scale.per_process_ops 11.7% regression
Message-ID: <20250127192616.GG1977892@ZenIV>
References: <202501261509.b6b4260d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501261509.b6b4260d-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jan 26, 2025 at 04:16:04PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 11.7% regression of will-it-scale.per_process_ops on:
> 
> 
> commit: 89359897983825dbfc08578e7ee807aaf24d9911 ("do_pollfd(): convert to CLASS(fd)")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test faield on linus/master      b46c89c08f4146e7987fc355941a93b12e2c03ef]
> [test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b183]
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 104 threads 2 sockets (Skylake) with 192G memory
> parameters:
> 
> 	nr_task: 100%
> 	mode: process
> 	test: poll2
> 	cpufreq_governor: performance
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202501261509.b6b4260d-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250126/202501261509.b6b4260d-lkp@intel.com

Very interesting...  Looking at the generated asm, two things seem to
change in there- "we need an fput()" case in (now implicit) fdput() in
do_pollfd() is no longer out of line and slightly different spills are
done in do_poll().

Just to make sure it's not a geniune change of logics somewhere,
could you compare d000e073ca2a, 893598979838 and d000e073ca2a with the
delta below?  That delta provably is an equivalent transformation - all
exits from do_pollfd() go through the return in the end, so that just
shifts the last assignment in there into the caller.

diff --git a/fs/select.c b/fs/select.c
index b41e2d651cc1..e0c816fa4ec4 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -875,8 +875,6 @@ static inline __poll_t do_pollfd(struct pollfd *pollfd, poll_table *pwait,
 	fdput(f);
 
 out:
-	/* ... and so does ->revents */
-	pollfd->revents = mangle_poll(mask);
 	return mask;
 }
 
@@ -909,6 +907,7 @@ static int do_poll(struct poll_list *list, struct poll_wqueues *wait,
 			pfd = walk->entries;
 			pfd_end = pfd + walk->len;
 			for (; pfd != pfd_end; pfd++) {
+				__poll_t mask;
 				/*
 				 * Fish for events. If we found one, record it
 				 * and kill poll_table->_qproc, so we don't
@@ -916,8 +915,9 @@ static int do_poll(struct poll_list *list, struct poll_wqueues *wait,
 				 * this. They'll get immediately deregistered
 				 * when we break out and return.
 				 */
-				if (do_pollfd(pfd, pt, &can_busy_loop,
-					      busy_flag)) {
+				mask = do_pollfd(pfd, pt, &can_busy_loop, busy_flag);
+				pfd->revents = mangle_poll(mask);
+				if (mask) {
 					count++;
 					pt->_qproc = NULL;
 					/* found something, stop busy polling */
