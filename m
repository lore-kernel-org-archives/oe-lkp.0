Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E90280CC8
	for <oe-lkp@lists.linux.dev>; Sun,  5 Oct 2025 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759665304; cv=none; b=ccO7KHRSoCkzFED2K06dPfv2JKycTFaQ11RJ+jMzGUETlpiqZ0swN4NsE9wyKk22FpvG3HsJK0z2+Z2DPQyNATpqF/bbIbEP9InXGhYU/UELYRUSH3lsOfdol2FuREF/2rtqD25h+p6EQWwEnY0eRwfd2OfmfEhKq19Jbikoibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759665304; c=relaxed/simple;
	bh=Wtyt1KzFariMlIeI+zEEMW0g/K5OklBCf8gbMrkr97g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJJhx87aah+1xZ1b1E9E0gpkXz/qHfnF08eGBIC4JC8S0o+tqGOp48xvEZjcwbooHr2Tr8kfyC5raoqO3a5cijq6GgcAz6KaiE6r/F0jMGB3N0njpeOEFdsWBXc73fYCCuZYzeuuX3fy4QVbnRoGrAPgr/9bjyYpw7G7uk5h3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=wK1oq6ch; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="wK1oq6ch"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3392914b3a.3
        for <oe-lkp@lists.linux.dev>; Sun, 05 Oct 2025 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1759665302; x=1760270102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=er8GqX660tZxnm8yI7a7bHZtQ/sKKbb/5edfsYblxJI=;
        b=wK1oq6chaQheIGdWE9gO+pEdC4ZcvNaaFrs1IJBVas8LP+UIJNaqhnk/RHqLYSDExV
         k85nG/Issdag0upCIDN27Lfw2suuhpk0HZH404QPDL72JXIN8bAG9fUun+08GH5UCadd
         e3aGzn7bUd2YdyvbLNxHhw7qSvyPchn8D/+hTn5+14xW4mp6P0+gMc7fC8dDkUExA9N/
         d7LoOr1g0P9/AUal2u4DxSYkszwnzFuSTdgE6+/uUx89XEzGv2nUs5kXcH60VI/3PDXz
         rjDPdK1KCDMCmpGm7rEdE6moOoG4XkCBZcHN9Mn3ueb8ed+0FSwU1VxMdj7C7/oUw/Uh
         jR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759665302; x=1760270102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er8GqX660tZxnm8yI7a7bHZtQ/sKKbb/5edfsYblxJI=;
        b=q6X+Q9/pMVCiM5OTj0Cde/gi+VjKVSaycaNneX0ryuhbwkhHyVD9iP+/mWi1ELcaAb
         RXh9tOD6LbEP1W2F1IkqIDn3Tc4lnb86MAJnka2HRYlo0eZk/z5x2DuNcNguEiawga0U
         Vm6bquwWuhYLxDk4Ma5l8XCGHne2F+HVSaqvikfm4KQ51CfurleHfQn7HIbsvApSGHLW
         rp3urQBF76RXJvYfrIB20kh9xL0OOih/iItqnhgldNcWpzeP/tIzjFMXrD/RBvDxtrzr
         gBoTr5hD+FeO3WP8TIYoPV8DMgFKO7lI38h7xzfxCt1UMxOLCkxXUQPkzKruT0tGxRep
         VBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn6pTayW9z/XhUvwBjHkR5u11n77ZQ1Ug08xDSK7wa23ISSA89MjYrNWDC7916M3lsd9gSyQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBzqYRXdYeIinGcCN7RQR9lPIxHnA7hUd3AjdplAmTQMOeEheu
	yyAM0mXxbl+YVg5SLJvJL+T9GI4gJnSWjBveW5HqYriQqymiTaAegjt6wLUhyC5uYCA=
X-Gm-Gg: ASbGnctzsuh+pB/RuqoSHunonYNzf1leXe9vca2lGWLyQrEokBWJ52MwNWZ+mwZGo3G
	3+a0NsSJEzp/lyFBzPkccKWCcxflhErrLf3WPYOzNEJJbDEDO0F+jN7279aKZLCcDPIxnL4MJJE
	+3mfPx6doU9yo/dyn8VUz6fZXq2nWfUzhOGWrSIF0gkv9cJElAWsawic9eIOnJLIBBVpUgGXbAX
	Nc4zOFoiIx0CtKb8+tlzT/Q7JjCmWd34X9+IhTcVdJsWdELzyaEH9KOX0YOD6B6xjCu7p7AK8TO
	AafSQ/NrgJr4UIiNTbplsYzGSP9URLIyCx/RPttXZyaSqbGjkwgfUcv9Oh1PQJhMcAsWOlB2v5P
	GPoZIDzUEqbkd6aDvLdaPl7nxarF0iuDvIwq2zNmgPGbSlISjM44h7+gT2ZFAlEBu6Jq9V8YRH5
	4VIynXRWkHbp9qO4ExWMuznw==
X-Google-Smtp-Source: AGHT+IFJenQ6xCL2kkGn0U9jKhBNcjWIfEAKLRN1RcMC27u89D+ljxfEAw22GmeKD+TuSCTAFauMxA==
X-Received: by 2002:a05:6a00:2e04:b0:77f:1ef8:8acb with SMTP id d2e1a72fcca58-78c98d45544mr11521737b3a.13.1759665301391;
        Sun, 05 Oct 2025 04:55:01 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-91-142.pa.nsw.optusnet.com.au. [49.180.91.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053a3asm9874688b3a.48.2025.10.05.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 04:55:00 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1v5NKL-0000000Aote-3xSr;
	Sun, 05 Oct 2025 22:54:57 +1100
Date: Sun, 5 Oct 2025 22:54:57 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <oliver.sang@intel.com>,
	Dave Chinner <dchinner@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-xfs@vger.kernel.org
Subject: Re: [linus:master] [xfs]  c91d38b57f:  stress-ng.chown.ops_per_sec
 70.2% improvement
Message-ID: <aOJckY5NnB2MaOqj@dread.disaster.area>
References: <202510020917.2ead7cfe-lkp@intel.com>
 <20251003075615.GA13238@lst.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003075615.GA13238@lst.de>

On Fri, Oct 03, 2025 at 09:56:15AM +0200, Christoph Hellwig wrote:
> On Thu, Oct 02, 2025 at 04:11:29PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 70.2% improvement of stress-ng.chown.ops_per_sec on:
> 
> I wonder what stress-ng shown is doing, because unless it is mixing fsync
> and ilock-heavy operations on the same node this would be highly
> unexpected.

stress-ng puts a fsync() at the end of every ops loop:

	do {
		int ret;

		ret = do_fchown(fd, bad_fd, cap_chown, uid, gid);
		if ((ret < 0) && (ret != -EPERM)) {
			pr_fail("%s: fchown failed, errno=%d (%s)%s\n",
				args->name, errno, strerror(errno),
				stress_get_fs_type(filename));
			rc = EXIT_FAILURE;
			break;
		}

		ret = do_chown(chown, filename, cap_chown, uid, gid);
		if ((ret < 0) && (ret != -EPERM)) {
			pr_fail("%s: chown %s failed, errno=%d (%s)%s\n",
				args->name, filename, errno, strerror(errno),
				stress_get_fs_type(filename));
			rc = EXIT_FAILURE;
			break;
		}
		ret = do_chown(lchown, filename, cap_chown, uid, gid);
		if ((ret < 0) && (ret != -EPERM)) {
			pr_fail("%s: lchown %s failed, errno=%d (%s)%s\n",
				args->name, filename, errno, strerror(errno),
				stress_get_fs_type(filename));
			rc = EXIT_FAILURE;
			break;
		}
>>>>>>>>	(void)shim_fsync(fd);
		stress_bogo_inc(args);
	} while (stress_continue(args));

It's also triggering a change in rwsem contention behaviour on the
inode->i_rwsem in chown_common(), from sleeping to spinning, because
fsync() no longer causes ILOCK_EXCL lock contention and causes the
task currently doing a chown operation to wait on the ILOCK_EXCL
whilst holding the inode->i_rwsem.

Hence all the chown() operations now trigger the spin-on-waiter
heuristic on the inode->i_rwsem as the lock holder never releases
the CPU during the modification. That explains why the CPU usage
increase (from ~2 CPUs to ~50 CPUs) is way out of proportion with
the actual increase in performance.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
