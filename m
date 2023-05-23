Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1B1B8F2
	for <oe-lkp@lists.linux.dev>; Tue, 23 May 2023 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684825593; x=1716361593;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=fR8HB2n9ezHVRM9B2hodfzVRG1PK2D+2ABIDICohet0=;
  b=VEG9WjGYPxv4GFsGNNqLuJcamTa/eTmF8qMUCdF2CzT2ZWO+JArvYc20
   N7HTczOnLRos6sbmkm7XmPGyRov/QefdVfgC77dkSnBUnwVHTiM+flAWM
   HFz/4Ak2n7ScfNiOBN5wS2Z8oNyA1GZCtugfEJKzj7eaj9ZVcQytldSki
   RVBUN8YbtVlRQCzaihZpkwpd1Av669nUx0dwGNpIEwS9RWM4j7su1v9Ag
   9vk0JYkNvNeQYig0AENTBvFPKpiXb7EBkLFTIJ4QiheJhphDV0jSP8hc7
   kTh7UYYTGJBI66Y4DY4xa0QB3y6q+3CCkFeW07u5qAj5/Yiuo/3PEWeMj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="353181840"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="353181840"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 00:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697946091"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="697946091"
Received: from nmkenne1-mobl2.ger.corp.intel.com (HELO [10.252.53.154]) ([10.252.53.154])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 00:06:28 -0700
Message-ID: <058e2e0f-70b4-a506-3ada-2578b99e9163@linux.intel.com>
Date: Tue, 23 May 2023 10:07:27 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] tpm, tpm_tis: Handle interrupt storm
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, peterhuewe@gmx.de,
 jarkko@kernel.org, jgg@ziepe.ca
Cc: jsnitsel@redhat.com, hdegoede@redhat.com, oe-lkp@lists.linux.dev,
 lkp@intel.com, peterz@infradead.org, linux@mniewoehner.de,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 l.sanfilippo@kunbus.com, lukas@wunner.de, p.rosenberger@kunbus.com
References: <20230522143105.8617-1-LinoSanfilippo@gmx.de>
 <c772bcdf-8256-2682-857c-9a6d344606d0@linux.intel.com>
In-Reply-To: <c772bcdf-8256-2682-857c-9a6d344606d0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/05/2023 09:48, Péter Ujfalusi wrote:
>>  static void tpm_tis_gen_interrupt(struct tpm_chip *chip)
>> @@ -804,6 +857,15 @@ static void tpm_tis_gen_interrupt(struct tpm_chip *chip)
>>  		chip->flags &= ~TPM_CHIP_FLAG_IRQ;
>>  }
>>  
>> +static void tpm_tis_free_irq_func(struct work_struct *work)
>> +{
>> +	struct tpm_tis_data *priv = container_of(work, typeof(*priv), free_irq_work);
>> +	struct tpm_chip *chip = priv->chip;
>> +
>> +	devm_free_irq(chip->dev.parent, priv->irq, chip);
>> +	priv->irq = 0;
> 
> Should disable_interrupts() be called instead (with the locality
> request/relinquish)?
> 
> Is there a chance of a race or is a race matters?

Nevermind this comment, it is good.

-- 
Péter
