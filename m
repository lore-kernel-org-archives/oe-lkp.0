Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA723A3
	for <oe-lkp@lists.linux.dev>; Mon,  9 Jan 2023 22:57:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A3E35CF29;
	Mon,  9 Jan 2023 22:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1673305032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2QOFkARd7xfUhVpKSlF2eFCN0OcEj5g2HeY9vdkM=;
	b=h/Dzcdvo8qi68HPyGHdzT7j48QBbCimyi4m2hGNUeAW4uV4UqVJiU/DtAa/BLF2Oo8q2K4
	DzuP8ZTlDa8GMqFDtmy7lpyNkI8MmsegjgkMCOLarU1JoqjtM1CjHWWK05E56Hv6DakFci
	VawH1kiEallw7kWR27QNENKU2xZuIsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1673305032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mo2QOFkARd7xfUhVpKSlF2eFCN0OcEj5g2HeY9vdkM=;
	b=GnJIA1659/PuNcNbfugZp+PuDP0guzpib1GnpQ1prLUOfFDcRdNoyUxq8DABfQf57VU54l
	h3YUR1l3ZFhWiKDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DE0713583;
	Mon,  9 Jan 2023 22:57:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XrfwEcibvGMBJwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Mon, 09 Jan 2023 22:57:12 +0000
Message-ID: <654982ed-0ccd-8285-65b2-dc05f8b5bd27@suse.cz>
Date: Mon, 9 Jan 2023 23:57:12 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [linus:master] [mm, slub] fa9b88e459:
 kernel_BUG_at_include/linux/page-flags.h
Content-Language: en-US
To: kernel test robot <yujie.liu@intel.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Mike Rapoport
 <rppt@linux.ibm.com>, Christoph Lameter <cl@linux.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <202301081605.a2503af7-yujie.liu@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <202301081605.a2503af7-yujie.liu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/23 17:28, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed kernel_BUG_at_include/linux/page-flags.h due to commit (built with gcc-11):
> 
> commit: fa9b88e459d710cadf3b01e8a64eda00cc91cdd6 ("mm, slub: refactor free debug processing")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Thanks for trying to bisect the root cause to earlier commit than
0af8489b0216f, as we discussed. Here I strongly suspect it's also earlier
than this commit. Because the code changed here is only used with
SLUB_DEBUG, which is not enabled in your config. Only later in 0af8489b0216f
it becomes used also by SLUB_TINY.

> [test failed on linux-next/master 469a89fd3bb73bb2eea628da2b3e0f695f80b7ce]
> 
> in testcase: boot
> 
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 

