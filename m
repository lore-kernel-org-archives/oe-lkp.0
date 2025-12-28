Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CFDF59
	for <oe-lkp@lists.linux.dev>; Sun, 28 Dec 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766881121; cv=none; b=ChIAT0GMKK4iCndEtUsPsubPXShs9PN6FRAvxOj4UBMhi9PIhQlfR4TzVyGNWj+9scQvj9X7M/36iruJ/ubgX2ulPCegN+8/uYLFdDnp9VFnR8jzmLbnBlkM/PLE0ynkEJp6wQWYFuOTLHDWjz9mQlKSUPLmkavoVuSEL7TmurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766881121; c=relaxed/simple;
	bh=mA4xZkh+IOnROo9dYqtZQB8RfI56qce5+TX4AgzD1wM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PfzxpRhKYwCG73wg3++Rv5LiOcJ1KIpP+UMczE6yuT4rnWzuGgI9Wjlh7LMLRcSdJ0gJKgcINfCOEHyRJkYtXTZk8Tf9GDddnZLWpQHQPABE9ormd1l3j1H2Qp8Vpxdq7rZLvFOfIiX7f0ujooRKoAKfy39u68ehTEpHLXONpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ngo8rijB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ngo8rijB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766881118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqR5WHFE7nfIedlDLTwqJJFi0bNQgjEyNOznlTwzMF8=;
	b=Ngo8rijBYCGsJgZgJaCz9qHSr60zJ7mQsZa/yxXzF/CYTvTK+RAzWjkuI4sPh7JhkQU90r
	IUpvJF4WxLinxQrvPSEMYJ/YIEjnYd4vmAjrTjPQyp5EW5Rnzv4oAa5MOWGwmVC/aw/vV4
	PXA7/7FQxuHb17H9ZhLzECg3qxn3dnY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-cnTcXD5AO7a052TcRn0DYA-1; Sat, 27 Dec 2025 19:18:36 -0500
X-MC-Unique: cnTcXD5AO7a052TcRn0DYA-1
X-Mimecast-MFC-AGG-ID: cnTcXD5AO7a052TcRn0DYA_1766881116
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so158402891cf.0
        for <oe-lkp@lists.linux.dev>; Sat, 27 Dec 2025 16:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766881116; x=1767485916;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqR5WHFE7nfIedlDLTwqJJFi0bNQgjEyNOznlTwzMF8=;
        b=pVlP6RKaege+AXqujs8+r3F4Own56UShC1J4h6NSHCydZ3IA/pWx9JOFZeeO7/Zk8b
         bNeseVWv/AA05m5v0A/+eygD+YD91xBD7UoMxBM9pmrpFIcbMvaGRdyCLcMinP0d8Wkz
         UhbCy8XddtsnmeVsRyshk+ko5nSJkKhveDxm98hmFCzyWQ6FBI5hsgAD8/nS6zlFM+4z
         WK33oU0TxGJRJS/G500eT/lS03UR8NAarry/GSPKvxUk+NzU2c9h3GyYmZsdrKgNdt8D
         tkoDOBRaodjGn7h3ghAdJAFcYJmVI/ZG0XrTHfsTRmoLqKokn83TF8e2ODelS1HWY/YS
         nb8w==
X-Gm-Message-State: AOJu0Yyq/dUexrg5RRe6RE9+YFJjwirmBakVR/xO1JqJ9jqE9Y6GUe2V
	YxGQopCPeLtZ8jwN6zKh6pwoZvdcqoMwWsAGxEVW6knRKNmpDiwuNNS8s+qE22CqIA2PwlCfVTR
	lN7YO9LsvrraQ6pwLQnGtjkmo3BmM99ekfRradk7bU9Og3J3jkM+mzr1x+Q==
X-Gm-Gg: AY/fxX59zjQJow9zt6sXDeH/ucMVkEDRr+z2toplu3zoVFAEyiClEzD4ykqVhihKI49
	uKjzOwtzrAQDJnUf+Ax5CHBhOUddAACMUlxZep91iMPdeq3TxDmkVjGJIgRM9OcEI6+KwdUTP33
	8BAmhPReMp5bwMxmOPTeUKNtOFDpPhGcQ1oYL4wbdjqincsS0UdFQfJFQvtEIEb9xI3HjSM83i8
	hVes/Xj3Wtb6tWYDE5VRMll7er1xQmP3wZYv2DEUGqI1pUVkvnWbN1YYQlHZHJk4XYpBnsZNYBl
	AptV84+DJe+5jqJ3be0+PclYqXIUkCjoQo9h3jWTqEuEgSG0KYUwnqQ76Vw+d9UIxpl5zOcJsqM
	48ugisGh2AN5j4Ytz/PzrXSrkWFH8I4LPWY6ric9cRicdZfkdNGo=
X-Received: by 2002:ac8:6681:0:b0:4f6:fe06:6cf5 with SMTP id d75a77b69052e-4f81a80489emr7949651cf.28.1766881116253;
        Sat, 27 Dec 2025 16:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdcNz3k8Zcw6evwj0qQEpbP+CQXVPF3z7KIXIQn98bZQezQtwjFGuO/GyEM7uNUQswQYVdPw==
X-Received: by 2002:ac8:6681:0:b0:4f6:fe06:6cf5 with SMTP id d75a77b69052e-4f81a80489emr7949451cf.28.1766881115900;
        Sat, 27 Dec 2025 16:18:35 -0800 (PST)
Received: from [10.0.0.82] (97-127-77-149.mpls.qwest.net. [97.127.77.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac563f66sm186020801cf.15.2025.12.27.16.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 16:18:35 -0800 (PST)
Message-ID: <1db851cc-f1a8-4de6-a01e-37ec091094ce@redhat.com>
Date: Sat, 27 Dec 2025 18:18:34 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [fs] 51a146e059:
 BUG:kernel_hang_in_boot_stage
From: Eric Sandeen <sandeen@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202512230315.1717476b-lkp@intel.com>
 <fb920248-a0fc-432f-926f-c27b1760de58@redhat.com>
In-Reply-To: <fb920248-a0fc-432f-926f-c27b1760de58@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VUdbjKc8RI0ZYcCge1tu19qlFbFgo1IfVd7IOroSJfk_1766881116
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/26/25 2:01 PM, Eric Sandeen wrote:
> On 12/22/25 8:36 PM, kernel test robot wrote:
>>
>>
>> Hello,
>>
>>
>> we don't have enough knowledge to analyze the connection between the issue and
>> this change. just observed the issue is quite persistent on 51a146e059 and
>> clean on its parent.
> 
> Odd. Not much to go on, and I don't see any obvious connection either, but
> I'll see if i can reproduce.

I can more or less reproduce, I think, though I am not getting the hung task
warning.

Oddly if I just put the 

	struct dentry *(*mount) ...

member back in struct file_system_type it seems to resolve the problem.
Even if I give it a different symbol name (like mount_foo).

I'm confused.

-Eric

