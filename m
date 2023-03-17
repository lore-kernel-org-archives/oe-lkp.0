Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD1C65A
	for <oe-lkp@lists.linux.dev>; Fri, 17 Mar 2023 06:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ADFC433EF;
	Fri, 17 Mar 2023 06:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679035844;
	bh=FwNORm2z7EgotVkf6Y6iCjILfepzSXKUVVB30xpOWFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLZdzPRXFXKD6/L+Z5oU9Ss/XhzLlu15+WyhKn90xVDNWjEX0GUOdTinEt+NEOHUw
	 bTIW+50OY9iqdpCJAqzeCZKgbvm0ch+T3PG4Z1MNrmLg46U2PuReOiSvHzACd7prUU
	 MHHDS3mYIY6C2PdSMxaAdGzl1Om54yf+TOgeHxP8=
Date: Fri, 17 Mar 2023 07:50:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernel test robot <yujie.liu@intel.com>,
	Kees Cook <keescook@chromium.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	tangmeng <tangmeng@uniontech.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	aliyunlinux2-dev@linux.alibaba.com, jane.lv@intel.com
Subject: Re: [linux-stable-rc:linux-4.19.y] [panic] 4d00e68cfc:
 WARNING:at_fs/sysfs/file.c:#sysfs_emit_at
Message-ID: <ZBQNwcVBKwe1WU3h@kroah.com>
References: <202303141634.1e64fd76-yujie.liu@intel.com>
 <20230317063213.GC882@sol.localdomain>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317063213.GC882@sol.localdomain>

On Thu, Mar 16, 2023 at 11:32:13PM -0700, Eric Biggers wrote:
> On Tue, Mar 14, 2023 at 04:34:22PM +0800, kernel test robot wrote:
> > Greeting,
> > 
> > FYI, we noticed WARNING:at_fs/sysfs/file.c:#sysfs_emit_at due to commit (built with gcc-11):
> > 
> > commit: 4d00e68cfcfd91d3a8c794d47617429a96d623ed ("panic: Expose "warn_count" to sysfs")
> > https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> 
> It turns out this is a longstanding bug in 4.19.y and 4.14.y caused by a bad
> backport, which is not actually related to the above commit (or the patch series
> that contained it) at all.  I've sent out fixes:
> 
> 4.19: https://lore.kernel.org/r/20230317062743.313169-1-ebiggers@kernel.org
> 4.14: https://lore.kernel.org/r/20230317062801.313217-1-ebiggers@kernel.org

Thanks for these, I'll queue it up the next round.

greg k-h
