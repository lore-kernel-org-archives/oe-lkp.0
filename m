Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D539364EB2;
	Sun, 31 May 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222176; cv=none; b=qPVvXUI/PSR7PDmJUiIMz0uvCJFfprQ3vjwQhCcxjCoQRr3L7E+4wW8FV4b/uWB8HCRXpvAfFK9ROawPrJqFjkD8WsL2pfBspKJNvJGvwpG6tlMymbBpgORTkVfw4QlfMtUfCUA11zPuCNpUPQrCF2ILaH2ec2WwQbANGqkBVR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222176; c=relaxed/simple;
	bh=ZiZqBk5Kj8kq35XYv1RiWvizBLRWRn14R4kCkLZss+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m05JHra8apOEWFa2mxp88xVybW7xpPgTkJcSqvVIZPVb6MnVcOdq+W3s6k/u4ZLWT73EwvK8tQLtqVhfusNajWY403mGKih74F+ap2YJdzKwgy0nSFkKrPaQXofWrdPc01kYMvn9bf7wuCmWwumHkgU8JajjEcWJYYRyvdoZa+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 64VA9Rq8039200;
	Sun, 31 May 2026 19:09:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 64VA9RKC039197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 31 May 2026 19:09:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <158ffe47-df83-43e1-9a6e-b2ebd4dab5ee@I-love.SAKURA.ne.jp>
Date: Sun, 31 May 2026 19:09:28 +0900
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [lib/Kconfig.debug] 888c290a02:
 BUG:MAX_LOCKDEP_CHAINS_too_low
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
References: <202605311625.72d32001-lkp@intel.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202605311625.72d32001-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp
X-Virus-Status: clean

Hello.

The "lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels." patch was working
for a while without problems. I think you can test with "CONFIG_DEBUG_AID_FOR_SYZBOT=n"
to avoid this problem. Can you tell me what your problem is?

On 2026/05/31 17:52, kernel test robot wrote:
> 
> 
> Hello,
> 
> 
> this report is just FYI.
> 
> as we understand, this is a debug patch. and by it, we notice below config diff:
> 

