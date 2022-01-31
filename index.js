const GUILD_ID = process.env['GUILD_ID']
const CLIENT_ID = process.env['CLIENT_ID']
const TOKEN = process.env['TOKEN']
const PrettyTable = require('./prettytable.js');
const { Client, Intents, Constants, CommandInteractionOptionResolver, MessageEmbed } = require('discord.js');
const PMSDatabase = require('./database.js');
require('dotenv').config()

const client = new Client({ intents: [
  Intents.FLAGS.GUILDS, 
  Intents.FLAGS.GUILD_MESSAGES, 
  Intents.FLAGS.GUILD_MESSAGE_REACTIONS , 
  Intents.FLAGS.DIRECT_MESSAGES,
  Intents.FLAGS.DIRECT_MESSAGE_REACTIONS
] });
const { REST } = require('@discordjs/rest');
const { Routes } = require('discord-api-types/v9');
const { SlashCommandBuilder } = require('@discordjs/builders');

const commands = [
  {
    name: 'ping',
    description: 'Replies with Pong!',
    options: [
      {
        name: "num1",
        description: "The first number.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      },
      {
        name: "num2",
        description: "The second number.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      } 
    ]
  }, 
  {
    name: 'company-name',
    description: 'Lists all company names.'
  },
  {
    name: 'regions',
    description: 'Lists all region names and types.'
  },
  {
    name: 'employee-high-pay-between-years',
    description: 'example: /employee-high-pay-between-years year-x: 2018 year-y: 2020',
    options: [
      {
        name: "year-x",
        description: "After this year.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      },
      {
        name: "year-y",
        description: "Before this year.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      } 
    ]
  },
  {
    name: 'employee-used-sick-day-off-in-yr',
    description: 'example: /employee-used-sick-day-off-in-yr year: 2019',
    options: [
      {
        name: "year",
        description: "Sick days in this year.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      }
    ]
  },
  {
    name: 'accounts-live-chat-support-reqs',
    description: 'example: /accounts-live-chat-support-reqs year: 2022 char: m',
    options: [
      {
        name: "year",
        description: "Live chat requests before this year.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      },
      {
        name: "char",
        description: "First character in live chat request subject",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      }
    ]
  },
  {
    name: 'benefit-cost-on-employees',
    description: 'example: /benefit-cost-on-employees year: 2016 amount: 100',
    options: [
      {
        name: "year",
        description: "Starting date in of before this year.",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      },
      {
        name: "amount",
        description: "Benefits that cost over this dollar amount",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      }
    ]
  },
  {
    name: 'previous-employee-pay',
    description: 'example: /previous-employee-pay char: s',
    options: [
      {
        name: "char",
        description: "First character in employee last name",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      }
    ]
  },
  {
    name: 'hourly-in-dep-by-comp-city-loc',
    description: 'example: /hourly-in-dep-by-comp-city-loc company: Stop and Go amount: 10 ',
    options: [
      {
        name: "company",
        description: "Company name, can use /company-name to see avaliable names",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      },
      {
        name: "amount",
        description: "Hourly wages higher than this amount",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      }
    ]
  },
  {
    name: 'salary-employee-benefits',
    description: 'example: /salary-employee-benefits cost: 2000 char: s ',
    options: [
      {
        name: "cost",
        description: "Benefits less than this cost",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.NUMBER
      },
      {
        name: "char",
        description: "First character in last name",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      }
    ]
  },
  {
    name: 'salary-employee-job-titles',
    description: 'example: /salary-employee-job-titles company: Volumn',
    options: [
      {
        name: "company",
        description: "Company name, can use /company-name to see avaliable names",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      }
    ]
  },
  {
    name: 'benefits-by-region',
    description: 'example: /benefits-by-region name: WA type: State',
    options: [
      {
        name: "name",
        description: "Region name, can use /regions to see avaliable region names",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      },
      {
        name: "type",
        description: "Region type, can use /regions to see avaliable region types",
        required: true,
        type: Constants.ApplicationCommandOptionTypes.STRING
      }
    ]
  }
];

const rest = new REST({ version: '9' }).setToken(TOKEN);

(async () => {
  try {
    console.log('Started refreshing application (/) commands.');

    await rest.put(
      Routes.applicationGuildCommands(CLIENT_ID, GUILD_ID),
      { body: commands },
    );

    console.log('Successfully reloaded application (/) commands.');
  } catch (error) {
    console.error(error);
  }
})();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

client.on('interactionCreate', async interaction => {
  if (!interaction.isCommand()) return;

  if (interaction.commandName === 'ping') {
    const num1 = interaction.options.getNumber('num1')
    const num2 = interaction.options.getNumber('num2')
    await interaction.reply(`Pong! \n${num1 + num2}`);
  }

  else if (interaction.commandName === 'company-name') {
    db = new PMSDatabase();
    await interaction.reply(await db.companies());
  }

  else if (interaction.commandName === 'regions') {
    db = new PMSDatabase();
    await interaction.reply(await db.regions());
  }

  else if (interaction.commandName === 'employee-high-pay-between-years') {
    const yearX = interaction.options.getNumber('year-x')
    const yearY = interaction.options.getNumber('year-y')
    db = new PMSDatabase();
    await interaction.reply(await db.employeeHighPayBetweenYears(yearX, yearY));
  }

  else if (interaction.commandName === 'employee-used-sick-day-off-in-yr') {
    const year = interaction.options.getNumber('year')
    db = new PMSDatabase();
    await interaction.reply(await db.employeeUsedSickDayOffInYear(year));
  }

  else if (interaction.commandName === 'accounts-live-chat-support-reqs') {
    const year = interaction.options.getNumber('year')
    const char = interaction.options.getString('char')
    db = new PMSDatabase();
    await interaction.reply(await db.accountsLiveChatSupportReqs(year, char));
  }

  else if (interaction.commandName === 'benefit-cost-on-employees') {
    const year = interaction.options.getNumber('year')
    const amount = interaction.options.getNumber('amount')
    db = new PMSDatabase();
    await interaction.reply(await db.benefitCostOnEmployees(year, amount));
  }

  else if (interaction.commandName === 'previous-employee-pay') {
    const char = interaction.options.getString('char')
    db = new PMSDatabase();
    await interaction.reply(await db.previousEmployeePay(char));
  }

  else if (interaction.commandName === 'hourly-in-dep-by-comp-city-loc') {
    const company = interaction.options.getString('company')
    const amount = interaction.options.getNumber('amount')
    db = new PMSDatabase();
    await interaction.reply(await db.hourlyInDepByCompCityLoc(company, amount));
  }

  else if (interaction.commandName === 'salary-employee-benefits') {
    const cost = interaction.options.getNumber('cost')
    const char = interaction.options.getString('char')
    db = new PMSDatabase();
    await interaction.reply(await db.salaryEmployeeBenefits(cost, char));
  }

  else if (interaction.commandName === 'salary-employee-job-titles') {
    const company = interaction.options.getString('company')
    db = new PMSDatabase();
    await interaction.reply(await db.salaryEmployeeJobTitles(company));
  }

  else if (interaction.commandName === 'benefits-by-region') {
    const name = interaction.options.getString('name')
    const type = interaction.options.getString('type')
    db = new PMSDatabase();
    await interaction.reply(await db.benefitsByRegion(name, type));
  }
});

db = new PMSDatabase();
db.test();

client.login(TOKEN);