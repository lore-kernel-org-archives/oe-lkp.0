Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C919D8B6
	for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914887; cv=none; b=AH1958+cne43jSRWLKjCvK1oxWHMjEhL+KxalQtNBrauX7k6r4i2YyCRBjESeZfagKyg22sqKtYDDNiS8/r11RjOcQqMjgIqV7ryOytvJa/gSaQ6fm2rLNnLRBFInNejGIM6oPvKLhKG1x5a2OtroG4oY+h0iOgijXkVrYE8Sxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914887; c=relaxed/simple;
	bh=dNjbDtlzxfkTLfd5C4CwT1o+BZfVkjvBs8d0fn7OWyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxdQ+k5jFiDmUIDieUUoMNRIa3jDTRuoZzYDNsdKDMpq7rxDw+DA1TOFytsqK1rlOumik6EzRYLp365snslIHgAzbTGLWVyh/47fMJmBEyWPj3FeQGXSU8HxrGFvY/cC0f/fVKWZRt+okALjDp+DVv58YC7EyL3RQApvwV+Q53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AgXPNrXo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jX6ba0Jh; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AgXPNrXo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jX6ba0Jh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AgXPNrXo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jX6ba0Jh";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AgXPNrXo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jX6ba0Jh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B5DD21A4D;
	Thu, 25 Jul 2024 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721914883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfftK064woyy3AgbOLqIQpSFYeF78EThl6YZNku8S/M=;
	b=AgXPNrXoWYv5pLweM+MByljX8Sl0sA0AW3fWy3tXA8echcu81lSk1jiphmAbk8j8V/GSCx
	HJT3pOTWghZgxFNbsQQ8SPmSse8A1hLlby7D4/IeeruUMKfntKIIjWiuQT3S+6ssRGnL0r
	qCQHyzZw5GGEq5BzBt9nppCa2W1kfLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721914883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfftK064woyy3AgbOLqIQpSFYeF78EThl6YZNku8S/M=;
	b=jX6ba0Jh0Hzzhje2taUYx2mDK5Kh/JkzbwnOZ1LQ74TK4PuPXDAP+zwbd3NIMZ1MUfYo8a
	gb/baAdZBt2PhNCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AgXPNrXo;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=jX6ba0Jh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721914883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfftK064woyy3AgbOLqIQpSFYeF78EThl6YZNku8S/M=;
	b=AgXPNrXoWYv5pLweM+MByljX8Sl0sA0AW3fWy3tXA8echcu81lSk1jiphmAbk8j8V/GSCx
	HJT3pOTWghZgxFNbsQQ8SPmSse8A1hLlby7D4/IeeruUMKfntKIIjWiuQT3S+6ssRGnL0r
	qCQHyzZw5GGEq5BzBt9nppCa2W1kfLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721914883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfftK064woyy3AgbOLqIQpSFYeF78EThl6YZNku8S/M=;
	b=jX6ba0Jh0Hzzhje2taUYx2mDK5Kh/JkzbwnOZ1LQ74TK4PuPXDAP+zwbd3NIMZ1MUfYo8a
	gb/baAdZBt2PhNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10F7013874;
	Thu, 25 Jul 2024 13:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GvAeBANWomb9BgAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 25 Jul 2024 13:41:23 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A96DAA0996; Thu, 25 Jul 2024 15:41:07 +0200 (CEST)
Date: Thu, 25 Jul 2024 15:41:07 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>,
	oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <20240725134107.4wkkx4huw5r2ngol@quack3>
References: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
 <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
 <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
 <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020>
 <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1B5DD21A4D
X-Spam-Score: -3.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim]

On Fri 05-07-24 08:48:28, Amir Goldstein wrote:
> On Fri, Jul 5, 2024 at 5:09 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Wed, Jul 03, 2024 at 07:20:49PM +0300, Amir Goldstein wrote:
> >
> > [...]
> >
> > > > the data in our tests seem quite stable for a commit, such like for v6.10-rc1:
> > > >   "unixbench.throughput": [
> > > >     121545292.8,
> > > >     121629889.4,
> > > >     121598992.0,
> > > >     121492095.5,
> > > >     121645038.1,
> > > >     121556286.9
> > > >   ],
> > > >
> > >
> > > Are all those runs from the same boot?
> >
> > no. we reboot machine before each run.
> >
> > >
> > > > for the branch tip a82fd282befc7:
> > > >   "unixbench.throughput": [
> > > >     116675606.7,
> > > >     116840611.2,
> > > >     116738966.0,
> > > >     116956953.1,
> > > >     116704901.9,
> > > >     116997628.3,
> > > >     117141733.7,
> > > >     116660495.4
> > > >   ],
> > > >
> > >
> > > And these run?
> >
> > same.
> >
> > >
> > > Otherwise, we might have a fluctuation that happens at boot time
> > > or at mount time or something.
> > >
> > > >
> > > > let me combine the results from this branch together:
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > >
> > > > commit:
> > > >   v6.10-rc1
> > > >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > > >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > > >   64108c0b47db9 fanotify: pass optional file access range in pre-content event
> > > >   a82fd282befc7 fanotify: report file range info with pre-content
> > > >
> > > >        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> > > > ---------------- --------------------------- --------------------------- --------------------------- ---------------------------
> > > >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> > > >              \          |                \          |                \          |                \          |                \
> > > >  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08            -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.throughput
> > > >
> > > >
> > > > one thing I want to mention is the "%change" is always comparing to the first
> > > > column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comparing to
> > > > v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.10-rc1,
> > > > and so on.
> > >
> > > Thanks for clarifying - I did not read it this way.
> > >
> > > >
> > > > then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9 has about
> > > > -2.4% regression compareing to 94167e071109d.
> > > >
> > > > from above table, along the branch, the performance is kind of fluctuating,
> > > > dropped most on 64108c0b47db9, but then recovered a little on tip.
> > > >
> > >
> > > I can understand why 64108c0b47db91b would regress performance, but I
> > > cannot think
> > > of any possible explanation why a82fd282befc should improve performance,
> > > so I have to wonder if the regression to -6.6% is not a fluke of some
> > > specific boot/mount?
> > >
> > > I pushed a test branch to
> > > https://github.com/amir73il/linux/commits/fsnotify_for_lkp
> > > with an extra patch that un-inlines some helpers to help bisect the
> > > perf report better.
> > > Maybe produce the report with this commit and it sheds some light.
> >
> > since
> >
> > * 388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify helpers
> > * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events
> > * f301cd18006c3 fanotify: rename a misnamed constant
> > * 64108c0b47db9 fanotify: pass optional file access range in pre-content event
> > * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > * 83af0c89527ab fsnotify: generate pre-content permission event on exec
> > * aca4084213276 fsnotify: generate pre-content permission event on open
> > * 93656e196b006 fsnotify: introduce pre-content permission event
> > * 1613e604df0cd (tag: v6.10-rc1,
> >
> > we run tests upon new commit. summary report is as below:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   v6.10-rc1
> >   a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events
> >   388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify helpers
> >
> >        v6.10-rc1 a82fd282befc71d99106bf31066 388baed2ddef701fe2f07ea0360
> > ---------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \
> >  1.216e+08            -3.9%  1.168e+08            -4.1%  1.166e+08        unixbench.throughput
> >:
> >
> > since Jan mentioned in a later mail that perf profiles are useful, I put details
> > as below
> 
> Thanks.
> That clarifies that the cycles are spent in the "optimization code" itself.

BTW, Amir how did you decide that the time is spent in the "optimization
code"? I've seen in the perf output there are more cache misses, smaller
IPC, but didn't see a particular place where this would be happening...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
