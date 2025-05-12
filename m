Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9181DEFDD
	for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058239; cv=none; b=cCNK2A+JZcU5Zo438IIPaLNZ8tUGpXoWIOzgPH0+NVZYhN/5HuGZUBRaMyFtdFZ443zxQ1AMYB6u+AMj95S3SFY+9UY/skeZ7727H3n2c69T2dZHteF3QXT6nx7QP2wUmuysAJ2gUmOryudWJscPq1+p+/jB/vSHiUdPIc+7Ak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058239; c=relaxed/simple;
	bh=05H8JpjKY35SdPO8KI6iVeXLxFQWAJS1wj4NnitynvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4E7D2asep+LykUmpPX1FcxNwvTgfN+V4VYyyDv13qJXGDaze/aZBZ1WcXjod2gXC/6BeQupsp0JnHgbGvInrTWL0KOY5P+6rRuqIfrFlr3MET4JXXOyizYcAbkLh/2LA4M+Jw1dd806T3gJ+cvLcoTCcwqOTsLauC2eCLdJCTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdZ//1/C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdZ//1/C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e8e4423ecso39439415ad.0
        for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747058236; x=1747663036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN5gSHLw3iiOyOm7rZHDOXQuNi2nQ5wWFGqnZaf6CLM=;
        b=BdZ//1/CVEGXnsTBzwpEuG2YX1Nqh3GYQaqlWWhCr9ajs0iQJCbE0NwpqQdotjQ5xR
         aevH/YaSt7iXnsbg+FST1OOS3n3Hr+8kTvqzrLVP5gMehTp4Gx9+x0XCUZQJA/Dv0Y8U
         NUHp6Qi9FQ+mvXNU0IrxWWSiHxP+ohbXfqLpSCBHQxjFpOccr2jCQbkMeADN1BkAchnP
         S8zwtg4aI6C2vbRGYFPtpq1eNkQP8rGIj1N3caAvCede0A02w5JmreKz3KG44sJvOjVq
         mMwW7q/L5fa3vFlGHrow+T0uMGXHqS+YWvGZfy13GujAUGh/uaLInehg2qM8OVUdDLRe
         XgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058236; x=1747663036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN5gSHLw3iiOyOm7rZHDOXQuNi2nQ5wWFGqnZaf6CLM=;
        b=sKO8903i7KSl8bdf9ucnlJlOuFDZxu31iYxyUW7/UEXCMYYUjTpyhiT1GsAfZ0um4l
         Clvh/wZv9CnZoTk9wPkQisWxru+KAHJ/6eFVkeTU7uOZbBLvY75+gySojI7Wmgxg6MIr
         YW5EfEt5ZLj2/tDral5r5BxDt6m3P0S5aEhC/UllVf+CDAqJL3Rd1q12Pi9m7dSQeQEr
         XDEsSxhodXPJn5PVtNHtWZP/hdqcf4oFJRU1QLyT1X8lg1qrAUshVShJYVesTQtbbbzs
         YpAQJxGwOzWtfbfRzDlLaWAiAHPOi28CfCm0IWDOfDV0r8/m7MGwoumPtVAWp5kQ6hzt
         TXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc6QMjdqJGfrIICrwdDqzUt8rmW7GXCi7k1yseIOXC4UjqAWKl/F134f25hN8hR3JM1nEZBF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXrsco/UrFtMFlseKjCv7nMKeDxz1GZ/ygEZOa3iboaVbc0tEK
	K75aWI98X19Na18jtlvfvIosi9MnNzpaStf/2UDMLCw0bcmKKKce
X-Gm-Gg: ASbGncv1a92F8uelWTUDuTvtBG34Hmx6uSwTfaiOE/La4VZf8swyVLtY3gwZMIAkRBe
	+d2lbl/dvRzZHN18QlFEE0JxWAzYUwtXGjEd3fCWmBGyNH2GT4C+eLpKwZf3+znvEEe7wnvcWRR
	x+PXAFP4G4zX3wXARyImE9OIuHPHMh7O8pKlaETyzE3FCl5qqfFxa4UPX0/w/jfE7hg0qfS0gvg
	o4UmDggQFMs+o1qH2qWIx0WhriAEPKXSgKf9Wwm7xzWNJ1hMKNUf4KyxOvKX48C4zuYt4o9kgIW
	DMbttuQnVVNsdioJ/BY4UcStSrqZh+hcggsoxpfVSZFeK27AAuDrPMspL6yRK7uh3Z/6ysvSmai
	f7uaArZGDLrWL5azFJ1bkQfC08ltDenCJh3ENlM7cc3OW93ZMGIdE+KD9sI8=
X-Google-Smtp-Source: AGHT+IFywl13Dph106GWlo1h3hEoMGAJaBIrJd19Hxw1kXTgrE5Xd4uuO/U4r97s3z0wwStvtpT8fw==
X-Received: by 2002:a17:903:166b:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22fc8b0fa27mr156037045ad.6.1747058235694;
        Mon, 12 May 2025 06:57:15 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a38ccsm62985465ad.235.2025.05.12.06.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:57:15 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: pmladek@suse.com
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	ryotkkr98@gmail.com
Subject: Re: [PATCH] rslib: Add scheduling points during the test
Date: Mon, 12 May 2025 22:57:11 +0900
Message-Id: <20250512135711.5307-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aCHfvBOY0vQ58uaC@pathway.suse.cz>
References: <aCHfvBOY0vQ58uaC@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 12 May 2025 13:47:08 +0200, Petr Mladek wrote:
>On Sat 2025-05-10 10:35:15, Ryo Takakura wrote:
>> The test has been prone to softlockup but stayed unnoticed because
>> of the printk calls during the test resets the soflockup watchdog by
>> calling touch_nmi_watchdog(). With the commit b63e6f60eab4 ("serial:
>> 8250: Switch to nbcon console"), the printk calls no longer suppress
>> the softlockup and warnings can be observed more evidently that shows
>> the test needs more scheduling points.
>> 
>> Provide scheduling points by adding cond_resched() for each test
>> iteration on their up to/beyond error correction capacity.
>> 
>
>We should add here:
>
>Reported-by: kernel test robot <oliver.sang@intel.com>
>Closes: https://lore.kernel.org/oe-lkp/202501221029.fb0d574d-lkp@intel.com
>
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>
>Otherwise, it looks good to me:
>
>Reviewed-by: Petr Mladek <pmladek@suse.com>
>
>Thanks a lot for nailing it down.

I totally forgot the Reported-by and Closes, thanks!
I'll add them along with your Reviewed-by.

Sincerely,
Ryo Takakura

>Best Regards,
>Petr
