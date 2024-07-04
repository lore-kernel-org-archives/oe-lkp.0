Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197B91B120C
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jul 2024 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107552; cv=none; b=mZ//ghAtdOgm0FvDDCy+jF7mdWQTVjTAduzZPOXIz7lcXE/FK9OsxpbeGaL67LvBW2Yh7TYSUUFoBNsa+wd+5frXz5mldRI6lEv1eQ05WQkeKIHiMHYxVoeusITM97eaTRDRjbasR+FzflxpwQcsGC6tOSns0SwMiUdl5kG4xP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107552; c=relaxed/simple;
	bh=/KU1MIoafRX9/+iAKKFv+xqA9Fb+65EOvejhiSTUHKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LukBTDXcOcxGXUPZyTuDvpL9fi4jylI8DS1QmcHuDMv1fskA5QDOVVmLL4azqjgpqE7yDxlvgJh+EnEBTNmZbq7wZ8p9v6E/vY8wiJbHztPlBPd4Get6WwWrndU3ZxPnj6/7aRHlMZxyaVgaCu/cJmE1Oq9RQYb60ZSZHxrCUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=veUjJ0Uw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6pXHQXeQ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=veUjJ0Uw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6pXHQXeQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="veUjJ0Uw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6pXHQXeQ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="veUjJ0Uw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6pXHQXeQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30DC621243;
	Thu,  4 Jul 2024 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1720107548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdQGNY//bCTNddJKHSulOOc/3jMS0h/dE01eVFdGKkQ=;
	b=veUjJ0Uwt207gC5WdLS+AucmrVFiAYqQpMgGMFJWli+Oslj180+By9jRe1D8lSW4WpJGsJ
	IVacX6sDACWvlriUK4Tgww6flecE4TeL3McrULLlrjtUHRcBGsa6UcKPpUDWgJ0N9ZIeP8
	fRYE3TI/aRdhqLw0IqsJI7m6+mrBU9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1720107548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdQGNY//bCTNddJKHSulOOc/3jMS0h/dE01eVFdGKkQ=;
	b=6pXHQXeQxM/B+jGQP4ZO19D/diYJKW0RDeMpcFUUEub1aS7o+Y1RqjaHZ+YeZb/5UU6mPg
	stqgjVowISdZJ9DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1720107548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdQGNY//bCTNddJKHSulOOc/3jMS0h/dE01eVFdGKkQ=;
	b=veUjJ0Uwt207gC5WdLS+AucmrVFiAYqQpMgGMFJWli+Oslj180+By9jRe1D8lSW4WpJGsJ
	IVacX6sDACWvlriUK4Tgww6flecE4TeL3McrULLlrjtUHRcBGsa6UcKPpUDWgJ0N9ZIeP8
	fRYE3TI/aRdhqLw0IqsJI7m6+mrBU9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1720107548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdQGNY//bCTNddJKHSulOOc/3jMS0h/dE01eVFdGKkQ=;
	b=6pXHQXeQxM/B+jGQP4ZO19D/diYJKW0RDeMpcFUUEub1aS7o+Y1RqjaHZ+YeZb/5UU6mPg
	stqgjVowISdZJ9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 250961369F;
	Thu,  4 Jul 2024 15:39:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /DQGCRzChmatRQAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 04 Jul 2024 15:39:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id CF539A08A5; Thu,  4 Jul 2024 17:39:07 +0200 (CEST)
Date: Thu, 4 Jul 2024 17:39:07 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>,
	oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <20240704153907.ssifyftmrqtit5e7@quack3>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
 <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
 <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Wed 03-07-24 19:20:49, Amir Goldstein wrote:
> On Wed, Jul 3, 2024 at 10:21 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > On Wed, Jul 03, 2024 at 08:58:13AM +0300, Amir Goldstein wrote:
> > > On Mon, Jul 1, 2024 at 10:42 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > On Tue, Jun 04, 2024 at 03:33:39PM +0300, Amir Goldstein wrote:
> > > > > On Mon, Jun 3, 2024 at 11:13 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > > > On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > > > > > > On Fri, May 31, 2024 at 6:15 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > > > > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > > > > > > > On Wed, May 29, 2024 at 11:26 AM kernel test robot
> > > > > > > > > <oliver.sang@intel.com> wrote:
> > > > > > > > > > kernel test robot noticed a -7.9% regression of unixbench.throughput on:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
> > > > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Jan,
> > > > > > > > >
> > > > > > > > > I speculate that the regression is due to the fact that we store and pass the
> > > > > > > > > path information on struct file_range on the stack before the optimizations
> > > > > > > > > in fsnotify_parent(), so rw_verify_area() pays some price for the stores
> > > > > > > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > > > > > > >
> > > > > > > > > Luckily, we already have the way to check
> > > > > > > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > > > > > > >                                                FSNOTIFY_PRIO_PRE_CONTENT))
> > > > > > > > > so now I used it to optimize out the fsnotify_file_range() inline
> > > > > > > > > code entirely.
> > > > > > > > >
> > > > > > > > > Oliver,
> > > > > > > > >
> > > > > > > > > Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> > > > > > > > >
> > > > > > > > > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > > > > > > > > with pre-content events
> > > > > > > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > > > > > > * 64108c0b47db - fanotify: pass optional file access range in pre-content event
> > > > > > > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> > > > > > > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> > > > > > > > > * 83af0c89527a - fsnotify: generate pre-content permission event on exec
> > > > > > > > > * aca408421327 - fsnotify: generate pre-content permission event on open
> > > > > > > > > * 93656e196b00 - fsnotify: introduce pre-content permission event
> > > > > > > > >
> > > > > > > > > The optimization was done in the first commit (fsnotify: introduce
> > > > > > > > > pre-content permission event),
> > > > > > > > > but impacts the regressing commit (fanotify: pass optional file access
> > > > > > > > > range in pre-content event).
> > > > > > > > > no need to test all middle commits.
> > > > > > > >
> > > > > > > > I directly compare the tip with v6.10-rc1, still a regression but better now
> > > > > > > >
> > > > > > > > =========================================================================================
> > > > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > > > >
> > > > > > > > commit:
> > > > > > > >   v6.10-rc1
> > > > > > > >   a82fd282befc7 ("fanotify: report file range info with pre-content events")
> > > > > > > >
> > > > > > > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > > > > > > ---------------- ---------------------------
> > > > > > > >          %stddev     %change         %stddev
> > > > > > > >              \          |                \
> > > > > > > >  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
> > > > > > > >
> > > > > > > > full data is as below [1]
> > > > > > > >
> > > > > > > >
> > > > > > > > then I checked new "64108c0b47db - fanotify: pass optional file access range in pre-content event"
> > > > > > > >
> > > > > > > > it also has a small regression comparing to its parent, but better also.
> > > > > > > >
> > > > > > > > =========================================================================================
> > > > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > > > >
> > > > > > > > commit:
> > > > > > > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > > > > > > >   64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")
> > > > > > > >
> > > > > > > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > > > > > > ---------------- ---------------------------
> > > > > > > >          %stddev     %change         %stddev
> > > > > > > >              \          |                \
> > > > > > > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> > > > > > > >
> > > > > > > > full data is as below [2]
> > > > > > > >
> > > > > > >
> > > > > > > Ok, this looks sane, the small overhead in the write path makes sense.
> > > > >
> > > > > On second look, while a small regression from 64108c0b47db9 could make
> > > > > sense, because it changes the inline fsnotify hooks, the extra regression from
> > > > > the tip of the branch a82fd282befc7 makes no sense at all, as it does not
> > > > > touch any code that affects the executed functions, so I have to wonder how
> > > > > reliable are those results.
> > > > >
> > > > > Could you re-test the commits 94167e071109d..a82fd282befc7?
> > > >
> > > > since the branch is:
> > > >
> > > > * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events  <---
> > > > * f301cd18006c3 fanotify: rename a misnamed constant
> > > > * 64108c0b47db9 fanotify: pass optional file access range in pre-content event
> > > > * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event           <---
> > > > * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event           <--- parent of 94167e071109d
> > > > * 83af0c89527ab fsnotify: generate pre-content permission event on exec
> > > > * aca4084213276 fsnotify: generate pre-content permission event on open
> > > > * 93656e196b006 fsnotify: introduce pre-content permission event
> > > > * 1613e604df0cd (tag: v6.10-rc1,
> > > >
> > > >
> > > > I made below comparison, which shows little difference among 3 commits:
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > >
> > > > commit:
> > > >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > > >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > > >   a82fd282befc7 fanotify: report file range info with pre-content events
> > > >
> > > > 68e04c2451ba03a1 94167e071109d573a5fc1ff3061 a82fd282befc71d99106bf31066
> > > > ---------------- --------------------------- ---------------------------
> > > >          %stddev     %change         %stddev     %change         %stddev
> > > >              \          |                \          |                \
> > > >  1.174e+08            -0.9%  1.163e+08            -0.5%  1.168e+08        unixbench.throughput
> > > >
> > > >
> > >
> > > Hi Oliver,
> > >
> > > Perhaps I am not reading the report right, but how do these numbers reconcile
> > > with the previous report of regression:
> > >
> > > =========================================================================================
> > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > >
> > > commit:
> > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > >   64108c0b47db9 ("fanotify: pass optional file access range in
> > > pre-content event")
> > >
> > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> > >
> > > Is this a case of unstable results? something else?
> >
> > you could see the data for 94167e071109d are 1.163e+08 in both table.
> >
> > the data in our tests seem quite stable for a commit, such like for v6.10-rc1:
> >   "unixbench.throughput": [
> >     121545292.8,
> >     121629889.4,
> >     121598992.0,
> >     121492095.5,
> >     121645038.1,
> >     121556286.9
> >   ],
> >
> 
> Are all those runs from the same boot?
> 
> > for the branch tip a82fd282befc7:
> >   "unixbench.throughput": [
> >     116675606.7,
> >     116840611.2,
> >     116738966.0,
> >     116956953.1,
> >     116704901.9,
> >     116997628.3,
> >     117141733.7,
> >     116660495.4
> >   ],
> >
> 
> And these run?
> 
> Otherwise, we might have a fluctuation that happens at boot time
> or at mount time or something.

So what I suspect is that the fluctuation actually happens "per compile
time". Depending on how exactly some hot paths get aligned in the compiled
kernel binary wrt CPU cachelines or similar, you get differences in
performance. I've seen that happening quite a few times in the past and the
observed differences are well in that range.

> > let me combine the results from this branch together:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   v6.10-rc1
> >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> >   64108c0b47db9 fanotify: pass optional file access range in pre-content event
> >   a82fd282befc7 fanotify: report file range info with pre-content
> >
> >        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> > ---------------- --------------------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \          |                \
> >  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08            -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.throughput
> >
> >
> > one thing I want to mention is the "%change" is always comparing to the first
> > column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comparing to
> > v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.10-rc1,
> > and so on.
> 
> Thanks for clarifying - I did not read it this way.
> 
> >
> > then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9 has about
> > -2.4% regression compareing to 94167e071109d.
> >
> > from above table, along the branch, the performance is kind of fluctuating,
> > dropped most on 64108c0b47db9, but then recovered a little on tip.
> >
> 
> I can understand why 64108c0b47db91b would regress performance, but I
> cannot think of any possible explanation why a82fd282befc should improve
> performance, so I have to wonder if the regression to -6.6% is not a
> fluke of some specific boot/mount?

I agree. In my opinion at least some of those changes are not related to
code changes but rather to random code alignment changes.

> I pushed a test branch to
> https://github.com/amir73il/linux/commits/fsnotify_for_lkp
> with an extra patch that un-inlines some helpers to help bisect the
> perf report better.
> Maybe produce the report with this commit and it sheds some light.
> 
> Jan, any other ideas?

Not really. These alignment induced fluctuations are annoying but I don't
know of a good way to avoid them. Even narrowing them down is tedious as
the changes on this scale are not easy to see in the profiles. So I'd check
the perf profiles and if we don't see any obvious regression in the changed
places, I'd just ignore the regression...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
