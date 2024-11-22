Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE715383F
	for <oe-lkp@lists.linux.dev>; Fri, 22 Nov 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732287243; cv=none; b=e89CNr9c5tJd4w6630A0iTW3XFULGegXgq4E/yoeDiMLcYm31j9RzH900+LFOtmEngmpWsHsV5/wqvvrxOu7kdNhc2DbJLM2cOcX9ZOhP4Gw3GeS8ZNEFkyVTxcS1ku8gjEjzeIdCLmn3ddQfjdjfMLGwmTK0J4PROkMWGQPf9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732287243; c=relaxed/simple;
	bh=QVy/1XkB1RqI0zvpm8rKiO0UAG8yi3ndNGtakNbq1YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD80K0nI/eu8P48cGuNGMRBYkFBWc2VJ4q1pdcK1jirrliSbv8LMPCswhHHpUOw99w1k/62Y0ROJ+ApR1CDNqD0K06k26uCxmuAJ0gDccHwa53YKtnglU5OjfImYFWR/1Rl5tPXUccx0XmQI1ITkDDsGaZiN0oTE/T0FwOfi3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 4AMErl8d006475;
	Fri, 22 Nov 2024 23:53:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 4AMErkXM006467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 22 Nov 2024 23:53:46 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e0a6a2b5-acff-4b58-9457-292864a5bc91@I-love.SAKURA.ne.jp>
Date: Fri, 22 Nov 2024 23:53:47 +0900
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [tomoyo] c5e3cdbf2a: Kernel_panic-not_syncing:STOP
To: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com
Cc: linux-kernel@vger.kernel.org, John Johansen
 <john.johansen@canonical.com>,
        Paul Moore <paul@paul-moore.com>
References: <202411221744.1a298e1e-lkp@intel.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202411221744.1a298e1e-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav102.rs.sakura.ne.jp
X-Virus-Status: clean

That commit is not bad.

Kernel config says

  CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
  # CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING is not set

which is a combination that cannot boot without doing one of choices listed below.

  Change CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING to y.

  Change CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER to n and
  install tomoyo-tools package and initialize on-disk policy.

  Modify built-in policy to include a complete set of on-disk policy.

On 2024/11/22 19:11, kernel test robot wrote:
> config: i386-randconfig-005-20241118

Please correct kernel config if random config selection hit this combination.

