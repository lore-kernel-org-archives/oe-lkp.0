Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80036D
	for <oe-lkp@lists.linux.dev>; Tue,  2 May 2023 00:39:34 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-51452556acdso2023259a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 01 May 2023 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1682987974; x=1685579974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwZqPVfdD98RGGdgHpZ/AzPHiqQjK6f8LQEk0yK0Zco=;
        b=rXB2JJkiTu4hICfIG4uv6uiV1xCmwftlY++WfORFpcseumSePfSrV6GkobqFSHMGwv
         8/tpLOL92wN+ea7V0SyV5Ii94EIkMav2jlegjcBELANssj3Pipph2H4zlGaxwGf7Hdeq
         68cNQbVzn0FzlED8v4yh64p+FSuSyIxT+qzvBELLjIN931Fbf3YldkX/kcuaTCqrlRrI
         SSoU2QOTcLaRumrJXi/l1SXAZtQe5kqbWQlBpfLchglrMzK07fHyGMlJZ6ynuT4ogAaq
         ki07HzmGoiWXrYJ24DoIkzdTa3STAn9BxEXosx7z/sC79gcMuK5PvmPM3PgbLd2lIIs5
         RQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682987974; x=1685579974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwZqPVfdD98RGGdgHpZ/AzPHiqQjK6f8LQEk0yK0Zco=;
        b=S2r+tWMyo/sgVofPmfArk2OimnKFLy3FDP38QeZDi5Lbrj1+TIqRdHEYetA3uSUFdm
         Uj2pNkp2K5NnLGG9PvOR7ZmN9HhpXjAcN8F+ImfGgOJhCb81PWnJGItpCx+0d/bOTKYb
         rOmXWlBU0dHoMLy082dBH+8J7A091Ca8cqMvLFjOoxCkpuSmKS6AjPT4U2t+jeKHEsBd
         Me+toLlHiXNbKvtBlqIIuqrcIyVN/Gmb7CpPNbhUwEvNm5KeqrbAsaoeAi3QOiXd9yfn
         czSnMbqwoacYtVMN6ncqm0Wixk5PR2QNiU8wPsoBgigKkIDHFaM+A+gUkXrT1cCNk3pg
         XtGQ==
X-Gm-Message-State: AC+VfDwkM6G540IQypN8Z6PU+CfLjcf1ayR5AyXqxpBIgcsCWGrKt27K
	7ZWBPXog3eETDkj3FGncnGJEvNJaoi8ylv+FQ5E=
X-Google-Smtp-Source: ACHHUZ5rNxN5VmHZ5p3Ayr0pXCHpUS5ZR8fFEU6KCZl5Ev01KAbw9hBMo2NXzR3u23sSG+cU9T+h5Q==
X-Received: by 2002:a17:902:f78a:b0:1a9:b62f:9338 with SMTP id q10-20020a170902f78a00b001a9b62f9338mr14109356pln.45.1682987974087;
        Mon, 01 May 2023 17:39:34 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-88-204.pa.nsw.optusnet.com.au. [49.181.88.204])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090adc8200b0024dfb08da87sm2614399pjv.33.2023.05.01.17.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 17:39:33 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1pte3F-00AG9K-Tc; Tue, 02 May 2023 10:39:29 +1000
Date: Tue, 2 May 2023 10:39:29 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-ext4@vger.kernel.org, ltp@lists.linux.it,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [jlayton:ctime] [ext4]  ff9aaf58e8: ltp.statx06.fail
Message-ID: <20230502003929.GG2155823@dread.disaster.area>
References: <202305012130.cc1e2351-oliver.sang@intel.com>
 <0dc1a9d7f2b99d2bfdcabb7adc51d7c0b0c81457.camel@kernel.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dc1a9d7f2b99d2bfdcabb7adc51d7c0b0c81457.camel@kernel.org>

On Mon, May 01, 2023 at 12:05:17PM -0400, Jeff Layton wrote:
> On Mon, 2023-05-01 at 22:09 +0800, kernel test robot wrote:
> The test does this:
> 
>         SAFE_CLOCK_GETTIME(CLOCK_REALTIME_COARSE, &before_time);
>         clock_wait_tick();
>         tc->operation();
>         clock_wait_tick();
>         SAFE_CLOCK_GETTIME(CLOCK_REALTIME_COARSE, &after_time);
> 
> ...and with that, I usually end up with before/after_times that are 1ns
> apart, since my machine is reporting a 1ns granularity.
> 
> The first problem is that the coarse grained timestamps represent the
> lower bound of what time could end up in the inode. With multigrain
> ctimes, we can end up grabbing a fine-grained timestamp to store in the
> inode that will be later than either coarse grained time that was
> fetched.
> 
> That's easy enough to fix -- grab a coarse time for "before" and a fine-
> grained time for "after".
> 
> The clock_getres function though returns that it has a 1ns granularity
> (since it does). With multigrain ctimes, we no longer have that at the
> filesystem level. It's a 2ns granularity now (as we need the lowest bit
> for the flag).

Why are you even using the low bit for this? Nanosecond resolution
only uses 30 bits, leaving the upper two bits of a 32 bit tv_nsec
field available for internal status bits. As long as we mask out the
internal bits when reading the VFS timestamp tv_nsec field, then
we don't need to change the timestamp resolution, right?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
