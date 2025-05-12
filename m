Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC89254B03
	for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050434; cv=none; b=nZ58bngOYlBoI3EWIlCmT1zHxxF1zFK11Sh07Kf8S8zVgo4GYuqpDedea04sy6TSDBfsjY2QfQKnYaCGwFjpjKnYOrF4Tiv97hk7f+c0rklWAcylhXrtiT5EQw+seDlqQgY/NriWtqdnMyFQS0EfXzeR1rryuJIlMPbzuMTn0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050434; c=relaxed/simple;
	bh=dYdmcxtOT0PL3hJhNzp7IkiVHqpd2RzVPV4jjj8pTeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3VbRwJ2YzIbYf2WNTNeQaxFb+L0TbvQP0+vXpOevZrEhdom5qrNEYN+oqWbzgrmql3UTZoJ24hc0yJE7VZUy2XOd5+X0Zxc78igp+XPxgRTCc3KNj6Xt8mp62YeyurKOzwdiaw1us1q0KRr7wRMlGO0n2y6wFQXLcHHoZjjr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a55tspK7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a55tspK7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad21cc2594eso453762466b.1
        for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747050430; x=1747655230; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVLv+spmoaAvztxddjO2Hy7beQH8ngEJQDm25GE/NA4=;
        b=a55tspK7Az6t+BR32kNveXE3HFg5S2xxE1z6E03UJTjyRE0OEGqS6ceOv2gDdob1DV
         Gd6YUIs4KKzBmUGQhL7pQDr3bLw1rmWosFLSpE9F3vXlFTTYnzXFyehQFphdceCJgtSv
         LVE7Sk2wanDfH7kZYo0f3C3MjasNuTkyWSTHg0GPjdXCNdSNbIedr5T/DlfPZFFG2xdI
         25uxRzN+AeM3bLBh3gJfO3yQ7mjXSZVM0S9886GRFZzJG6HEEAZ7E4ZV+SGWrLiJPnQY
         6COKPuDBX7t0NqQicWgqk5APaQNFrIdYRnVqzmoxtpaBX/IhIvdFm6WA7QOk7xzIccrG
         Xu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050430; x=1747655230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVLv+spmoaAvztxddjO2Hy7beQH8ngEJQDm25GE/NA4=;
        b=ZhvQleQC3hluprFblp0Um82xIjmZT34u0YG8QUn1HIv6A4AwaGZDngLmKDWhgBq+B2
         CioEayfoxaZ5hCpBa+ZcD5vcHSPRXo5Pq3cX/q3yB8cPC1GkKn0gIP0x0xdKT+MmAYlZ
         QDhPL57uugoPOVqcfO4kI9Qw3nmG1C4n1Hibex+Aj7ezwasmGM1jt9zDi9J3IvDtXYHX
         yKlOUq3vuJIRgzQtR/J9WueMQgCcBr8H0eS1XLU65dS9fACBWQL9DDlFap00tsFUbZgg
         8lKJwVmtCvN/6V/TZvKmJ5noDHTgRiO6aa23D2BFDz9fG1bti7Ir6ouDk7UgVL9IoqSd
         Frvw==
X-Forwarded-Encrypted: i=1; AJvYcCVUm6D8XezNFUeA+4nlWYFWXBIT6OJgk9JUTgG0v2aqFhdKTgorNioMbY7UZPT+ZLE/zLBHigE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiNXPKK9E1gvbnWnjTaurv0j6+kghQrjZCwP2M8mPuKtSBKOBQ
	ulMCto2QXaXrpnAv9RqZGGFshxWBoc2mNSmNfr+v9ue5d8xn/yC4vH/BMkcEmFY=
X-Gm-Gg: ASbGnct7yR/0ducHANjvHN9AG3a1E15HUpcOtfd2DQKOIi9JqfZvaGvaJ0Lwp9mqL2X
	IDOwQo76HrWPnAL6Ytcx3ts0w0EWqI2mjLI82HhV5KDdSaWXI2pZ+uGQOfzgc8/qzTGTmFdWeav
	Gtzt0LlV5g9PxgOwDM6x9/sqmkAGKk9DR8GtItG/DuCULVbza6Shfu4qunOzG6FenhwaTmob6js
	5h5FU79cY6YyQJ0NZaklUaUR6So6fniWpa6l7qa1N7F3R88kKSh82LQSC+kJm604OVXPdVx4Blo
	4Zwk9m6hzL1qOOvAv7lTxZ+v+7W6l7Tnn6Z2vMcDHuoOMEiEuU3Mxo3vr1S5RTYK
X-Google-Smtp-Source: AGHT+IE1VbmKMbNr2uygysNhb2Q2CrLOamNkk+qyab09zQFyHUhGx9xJDRQHSPfoK5VaWJdnc5BVDg==
X-Received: by 2002:a17:907:7ea0:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ad219057ff1mr1315018666b.36.1747050430347;
        Mon, 12 May 2025 04:47:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219346b85sm601439466b.49.2025.05.12.04.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:47:10 -0700 (PDT)
Date: Mon, 12 May 2025 13:47:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: john.ogness@linutronix.de, Jason@zx2c4.com, gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkp@intel.com, oe-lkp@lists.linux.dev, oliver.sang@intel.com
Subject: Re: [PATCH] rslib: Add scheduling points during the test
Message-ID: <aCHfvBOY0vQ58uaC@pathway.suse.cz>
References: <20250510013515.69636-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510013515.69636-1-ryotkkr98@gmail.com>

On Sat 2025-05-10 10:35:15, Ryo Takakura wrote:
> The test has been prone to softlockup but stayed unnoticed because
> of the printk calls during the test resets the soflockup watchdog by
> calling touch_nmi_watchdog(). With the commit b63e6f60eab4 ("serial:
> 8250: Switch to nbcon console"), the printk calls no longer suppress
> the softlockup and warnings can be observed more evidently that shows
> the test needs more scheduling points.
> 
> Provide scheduling points by adding cond_resched() for each test
> iteration on their up to/beyond error correction capacity.
> 

We should add here:

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202501221029.fb0d574d-lkp@intel.com

> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>

Otherwise, it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks a lot for nailing it down.

Best Regards,
Petr
