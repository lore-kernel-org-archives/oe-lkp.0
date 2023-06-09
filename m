Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5436D39
	for <oe-lkp@lists.linux.dev>; Fri,  9 Jun 2023 14:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F507C433EF;
	Fri,  9 Jun 2023 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686321306;
	bh=GrelE1oU7fHnF/QKSzxCLJDS8YzXOvcRsroBtktWfcc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qBWkWCtPbMtumfzCe/rmwzg6wF9G8e2vTA8YD3lg89GsvU34E3X7u/RepV2wsmRPX
	 qOYaaTKqfBrjdYXaY0y0xiMRCkE2JscNnRuiR92S3HLWDvfL5GvIqHEK/K/BwovqzG
	 xmoYiJ63jAfIqHEamyhdCSGPIRrjpyJWJE8ZqUBFo/vYk1StRbkYKAV9RjbVw1LCSm
	 rwT+NVO+5V0mALi9CoowIoaeoSlnR7LtCXiH4hwexbu+GAHaPLyyzV00/R0vre8Ja5
	 8/aB+MiHK992Qce48qWy6w/NJ2PAQUUcU56Q706X3NROLes6WkPMTgpB71vkJ3eIFy
	 JvE3GocMSmoRw==
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 17:34:59 +0300
Message-Id: <CT870EJAJV15.28GM6XSWAHF4D@suppilovahvero>
Cc: <jsnitsel@redhat.com>, <hdegoede@redhat.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, <peter.ujfalusi@linux.intel.com>, <peterz@infradead.org>,
 <linux@mniewoehner.de>, <linux-integrity@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <l.sanfilippo@kunbus.com>,
 <lukas@wunner.de>, <p.rosenberger@kunbus.com>, "kernel test robot"
 <yujie.liu@intel.com>
Subject: Re: [PATCH v2] tpm,tpm_tis: Handle interrupt storm
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Lino Sanfilippo"
 <LinoSanfilippo@gmx.de>, <peterhuewe@gmx.de>, <jgg@ziepe.ca>
X-Mailer: aerc 0.14.0
References: <20230530174712.6989-1-LinoSanfilippo@gmx.de>
 <CT86Z65L4O9A.2FIOFZUI6BVB4@suppilovahvero>
In-Reply-To: <CT86Z65L4O9A.2FIOFZUI6BVB4@suppilovahvero>

Short summary: tpm_tis: Disable interrupts after 1000 unhandled IRQs

I.e. the exact thing the commit changes. Handle means absolutely
nothing.

BR, Jarkko
