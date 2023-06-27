Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18164846A
	for <oe-lkp@lists.linux.dev>; Tue, 27 Jun 2023 07:54:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72FDD2188C;
	Tue, 27 Jun 2023 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687852498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KecKU55q0LbB0dz7ILmgT4b/M/Mu4Sdq+LZHaGAm+HM=;
	b=2kYzpEu4MqSbbW6sMHSyo1N//j9cTKIznke8zUFDeZ5X6Pu3Td9ROjwHgMtePKzbbjmUyN
	REJK0Vsf7Ro7zXyPQWSFaGS6sFcnD3qfuW2vZqdLfV1ivuQzpTvfCJT/IX3EN6Xa+N0okv
	8Uf+Q0suOG/4iWUKiR43RXfbqYNu74w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687852498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KecKU55q0LbB0dz7ILmgT4b/M/Mu4Sdq+LZHaGAm+HM=;
	b=Dk4NGoF4B+7UPYkc9jiB7feZ46wwFrC9OT7r0GRbLN5DFXy39YPWz7/5uogTKIWIh5lCRu
	ZR5yno/WhU8t/9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6568A13462;
	Tue, 27 Jun 2023 07:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tIe4GNKVmmTZKQAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 27 Jun 2023 07:54:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id DA95BA0762; Tue, 27 Jun 2023 09:54:57 +0200 (CEST)
Date: Tue, 27 Jun 2023 09:54:57 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Oliver Sang <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <20230627075457.fymnpqn3vrjxjs2u@quack3>
References: <202306192245.d77d7216-oliver.sang@intel.com>
 <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020>
 <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3>
 <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>

On Mon 26-06-23 18:13:55, Amir Goldstein wrote:
> On Mon, Jun 26, 2023 at 4:31 PM Jan Kara <jack@suse.cz> wrote:
> >
> > Hi Amir!
> >
> > On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> > > On Fri, Jun 23, 2023 at 5:48 PM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> > > > > On Tue, Jun 20, 2023 at 4:44 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > > > > kernel test robot noticed a -13.0% regression of stress-ng.ramfs.ops_per_sec on:
> > > > > >
> > > > > >
> > > > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement 'vfs write barriers'")
> > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > >
> > > > >
> > > > > Considering that this commit only adds helpers but never uses them
> > > > > this regression is a bit surprising.
> > > > >
> > > > > You had reported regressions in the past on the next commit:
> > > > > "vfs: prepare for pre-modify permission events on write"
> > > > >
> > > > > which made sense and I had since fixed and you verified.
> > > > >
> > > > > The only suspect I can think of is that adding the new s_write_*
> > > > > members to struct super_block had split the frequently access
> > > > > members s_fsnotify_connectors and s_readonly_remount into
> > > > > different cachelines.
> > > > >
> > > > > I've moved those new members to another location in the
> > > > > super_block struct and pushed the new branch to:
> > > > >
> > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > >
> > > > > I've added another commit at the tip of this branch:
> > > > > 67d1802889f0 ("fsnotify: activate sb write barriers for permission
> > > > > event watchers")
> > > > >
> > > > > This commit also adds a new member to struct super_block,
> > > > > next to s_fsnotify_connectors and s_readonly_remount, but this
> > > > > new member is also frequently accessed.
> > > > >
> > > > > I am hoping that you can also verify that the tip commit does not
> > > > > cause a regression.
> > > >
> > > > I finished the test on updated branch, but seems regression not be fixed.
> > > >
> > > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
> > > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > > >   309b0dd357c60 vfs: prepare for pre-modify permission events on write
> > > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers
> > > >
> > > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
> > > > ---------------- --------------------------- --------------------------- ---------------------------
> > > >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> > > >              \          |                \          |                \          |                \
> > > >    1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
> > > >      22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > > >
> > > > all detail comparison is as below, I also attached the config to build all
> > > > these four kernels.
> > > >
> > >
> > > Thank you Oliver!
> > >
> > > Jan,
> > >
> > > Do you have an idea of what might be going on here?
> >
> > Not really.
> >
> > > The only code change in the regressing commit is the addition
> > > of the s_write_* members to super_block and the addition of
> > > init_srcu_struct() call in alloc_super().
> > >
> > > Unless I am missing something.
> >
> > No, you are right. But it could also be some code alignment changing after
> > adding those new functions. Can you reproduce the regression on your
> > machine?
> 
> I have not tried yet.
> 
> > If yes, you could have a look at some micro-architectural perf
> > counters like iTLB misses or similar to see e.g. whether code of some hot
> > function didn't get split among two cachelines or similar issue. There's
> > also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in determining
> > whether function alignment is the issue or not.
> >
> 
> There is a lot of perf information in the report below, e.g.:
> 
> >    1259329 ±  2%    +405.3%    6363306          +404.5%    6353871          +408.1%    6398089        perf-stat.ps.cache-misses
> >     182239 ±  2%     +40.1%     255227 ±  9%     +38.0%     251400 ± 14%     +23.9%     225874 ±  6%  perf-stat.ps.dTLB-load-misses
> >      98768 ±  6%    +131.3%     228477          +130.1%     227267 ±  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses

Ah, OK. I got bored by turbostat, vmstat and other counters before
scrolling down to these ;). So looking at these stats it seems that
data accesses are incurring more cache misses. The truth is that struct
srcu_struct is huge (some 112 bytes) so maybe some frequently accessed
fields got split into different cachelines with its addition. Have you
tried putting it at the end of struct super_block just to rule this out? I
know you already had it elsewhere in struct super_block but I don't think
it was at the end.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
